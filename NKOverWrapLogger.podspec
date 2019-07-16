#
# Be sure to run `pod lib lint NKOverWrapLogger.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'NKOverWrapLogger'
  s.version          = '0.1.2'
  s.summary          = 'It is a logger that is always displayed at the top.'
  s.swift_version    = '4.2'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
It is a logger that is always displayed at the top.
It is useful when testing the operation such as Enterprise build, which is troublesome log output.
                       DESC

  s.homepage         = 'https://github.com/Atsumi3/NKOverWrapLogger'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Atsumi3' => 'atsumi@mail.bizen.jp' }
  s.source           = { :git => 'https://github.com/Atsumi3/NKOverWrapLogger.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/Atsumi3'

  s.ios.deployment_target = '8.0'

  s.source_files = 'NKOverWrapLogger/Classes/**/*'
  
  # s.resource_bundles = {
  #   'NKOverWrapLogger' => ['NKOverWrapLogger/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
