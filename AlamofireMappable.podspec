#
# Be sure to run `pod lib lint AlamofireMappable.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AlamofireMappable'
  s.version          = '1.0.0'
  s.summary          = 'Alamofire + ObjectMapper.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'Helper for parse Alamofire response to ObjectMapper object'

  s.homepage         = 'https://github.com/quocnb/AlamofireMappable'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'quocnb' => 'quocnb.vnu@gmail.com' }
  s.source           = { :git => 'https://github.com/quocnb/AlamofireMappable.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'
  s.swift_version   = '4.2'

  s.source_files = 'AlamofireMappable/Classes/**/*'
  
  # s.resource_bundles = {
  #   'AlamofireMappable' => ['AlamofireMappable/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'Alamofire'
  s.dependency 'ObjectMapper'
end
