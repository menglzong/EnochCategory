#
#  Be sure to run `pod spec lint EnochCategory.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name         = "EnochCategory"
  s.version      = "0.0.1"
  s.summary      = "扩展组件"
  s.description  = "UIImage，NSMutableAttributedString扩展组件"
  s.homepage     = "https://github.com/menglzong/EnochCategory"
  s.license      = "MIT"
  s.author       = { "menglingzong" => "menglingzong@zillionfortune.com" }
  s.source       = { :git => "https://github.com/menglzong/EnochCategory.git", :tag => s.version}
  s.source_files  = "EnochCategory/*"
  s.platform     = :ios, "8.0"
  s.frameworks = 'Foundation', 'UIKit' 
end
