Pod::Spec.new do |s|
  s.name         = "JREProgressView"
  s.version      = "0.0.1-so.1"
  s.summary      = "UIProgressView subclass"
  s.description  = <<-DESC
                   UIProgressView subclass that supports custom images on iOS 7.1.
                   DESC
  s.homepage     = "https://github.com/silverorange/JREProgressView"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.authors      =  { "Keith Burgoyne"   => "keith@silverorange.com",
                      "Michael Gauthier" => "mike@silverorange.com",
                      "John Rommel Estropia" => "" }
  s.platform     = :ios, "7.1"
  s.ios.deployment_target = "7.1"
  s.source       = { :git => "https://github.com/silverorange/JREProgressView.git", :tag => s.version.to_s }
  s.source_files  = "JREProgressView/*.{h,m}"
  s.public_header_files = "JREProgressView/*.h"
  s.requires_arc = true
  s.framework  = "UIKit"
end

