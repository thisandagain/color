Pod::Spec.new do |s|
  s.name         = "EDColor"
  s.version      = "1.0.0"
  s.summary      = "A collection of categories and utilities that extend UIColor."
  s.homepage     = "https://github.com/thisandagain/color"
  s.license      = 'MIT'
  s.author       = { "Andrew Sliwinski" => "andrewsliwinski@acm.org", "Daniel Doubrovkine" => "dblock@dblock.org" }
  s.source       = { :git => "https://github.com/thisandagain/color.git", :tag => "v1.0.0" }
  s.platform     = :ios, '6.0'
  s.source_files = 'Source'
  s.frameworks   = 'UIKit'
  s.requires_arc = true
end
