# react-native-id-verify.podspec

require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name         = "react-native-id-verify"
  s.version      = package["version"]
  s.summary      = package["description"]
  s.description  = <<-DESC
                  react-native-id-verify
                   DESC
  s.homepage     = "https://github.com/github_account/react-native-id-verify"
  # brief license entry:
  s.license      = "MIT"
  # optional - use expanded license entry instead:
  # s.license    = { :type => "MIT", :file => "LICENSE" }
  s.authors      = { "Your Name" => "yourname@email.com" }
  s.platforms    = { :ios => "9.0" }
  s.source       = { :git => "https://github.com/github_account/react-native-id-verify.git", :tag => "#{s.version}" }

  s.source_files = "ios/**/*.{h,c,cc,cpp,m,mm,swift}"
  s.vendored_frameworks = "ios/framework/*.{framework}"
  s.resources = "ios/bundle/*.{bundle}"
  s.library = "z.1.1.3","c++.1","icucore","c++abi"
  s.frameworks =  "CoreGraphics","CoreTelephony","QuartzCore",
                  "CoreFoundation","CoreLocation","CoreMedia",
                  "CoreMotion","AVFoundation","ImageIO",
                  "AssetsLibrary","Accelerate","UserNotifications",
                  "WebKit"
  s.requires_arc = true

  s.dependency "React"
  # ...
  # s.dependency "..."
end

