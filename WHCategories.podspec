version = "0.05";

Pod::Spec.new do |s|
  s.name         = "WHCategories"
  s.version      = version
  s.summary      = "a collection of useful Objective-C Categories extending iOS Frameworks"
  s.description      = <<-DESC
                       WHCategories , a collection of useful Objective-C Categories extending iOS Frameworks.
                       DESC
  s.homepage     = "https://github.com/WaferWang/WHCategories"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "王卫华" => "704556640@qq.com" }
  s.platform     = :ios, "7.0"
  s.ios.deployment_target = "7.0"
  s.requires_arc = true
  s.frameworks = 'Foundation', 'UIKit'
  s.libraries    = "z"
  s.source       = { :git => "https://github.com/WaferWang/WHCategories.git", :tag => "#{version}" }
  s.source_files = "WHCategories", "WHCategories/*.{h}","WHCategories/**/*.{h,m}"
  #s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
end