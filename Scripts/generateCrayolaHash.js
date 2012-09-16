/**
 * Generates a hash (NSDictionary literal) from http://en.wikipedia.org/wiki/List_of_Crayola_crayon_colors
 *
 * @package color
 * @author Andrew Sliwinski <andrew@diy.org>
 */

/**
 * Dependencies
 */
var async       = require('async'),
    fs          = require('fs'),
    request     = require('request'),
    jsdom       = require('jsdom');

/**
 * Fetch page from the specified url with a spoofed user agent.
 *
 * @param {String} Url target
 *
 * @return {String}
 */
function fetch (url, callback) {
    request({
        method:     'get',
        url:        url,
        headers: {
            'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_4) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/21.0.1180.89 Safari/537.1'
        }
    }, function (err, response, body) {
        callback(err, body);
    });
}

/**
 * Extract the first table from the supplied HTML string and transform into a JSON object.
 *
 * @param {String} HTML
 *
 * @return {Object}
 */
function extract (html, callback) {
    // Storage object
    var colors = new Object(null);

    // Use JSDOM to extract the table data
    jsdom.env({
        html: html
    }, function (err, window) {
        var table   = window.document.getElementsByClassName('wikitable')[0];
        var rows    = table.getElementsByTagName('tr');

        for (var i = 0; i < rows.length; i++) {
            var cells   = rows[i].getElementsByTagName('td');
            var key, value;

            // This is silly. Not sure why JSDom won't let me access this directly:
            for (var x = 0; x < cells.length; x++) {
                if (x === 1) { key = cells[x].innerHTML };
                if (x === 3) { value = cells[x].innerHTML };
            }

            colors[key] = value;
        }

        callback(null, colors);
    });
}

/**
 * Transforms the JSON array into the corresponding Objective-C macro.
 *
 * @param {Array} Input
 *
 * @return {String}
 */
function transform (items, callback) {
    // Storage object
    pairs = new Object(null);

    // Collapse key
    function collapse (input) {
        return input.toLowerCase().replace(/\s/g, ''); 
    }

    // Convert to float
    function toFloat (input) {
        var precision   = 3;
        var output = (input / 255).toFixed(precision);

        return (isNaN(output)) ? '0.0' : output;
    }

    // Convert RGB values to object
    function toObject (input) {
        var channels    = input.replace('(', '').replace(')', '').split(', ');
        return '[UIColor colorWithRed:' + toFloat(channels[0]) + 'f green:' + toFloat(channels[1]) + 'f blue:' + toFloat(channels[2]) + 'f alpha:1.0f]'
    }

    for (var item in items) {
        try {
            pairs[collapse(item)] = toObject(items[item]);
        } catch (err) {}
    }

    callback(null, pairs);
}

function compose (pairs, callback) {
    var prefix  = '// Source: http://en.wikipedia.org/wiki/List_of_Crayola_crayon_colors\n// To generate: cd Scripts; make\n#define CRAYOLA_HASH @{ ';
    var body    = '';
    var suffix  = ' }';

    for (var pair in pairs) {
        body += '@"' + pair + '" : ' + pairs[pair] + ', '
    }

    callback(null, prefix + body.slice(0, -2) + suffix);
}

// -----------------------------------
// Execute
// -----------------------------------

async.auto({
    fetch:      function (callback) {
        fetch('http://en.wikipedia.org/wiki/List_of_Crayola_crayon_colors', callback);
    },

    extract:    ['fetch', function (callback, obj) {
        extract(obj.fetch, callback);
    }],

    transform:  ['extract', function (callback, obj) {
        transform(obj.extract, callback);
    }],

    compose:    ['transform', function (callback, obj) {
        compose(obj.transform, callback);
    }],

    io:         ['compose', function (callback, obj) {
        fs.writeFile(__dirname + '/../EDColor/Crayola.h', obj.compose, callback);
    }]
}, function (err, obj) {
    if (err) {
        console.log('ERROR: ' + err);
    } else {
        console.log('Complete!');
    }
});