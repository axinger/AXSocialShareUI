#
# Be sure to run `pod lib lint AXSocialShareUI.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AXSocialShareUI'
  s.version          = '0.1.0'
  s.summary          = 'A short description of AXSocialShareUI.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
依赖于MonkeyKing(因为OC不能直接调用),制作的社会化社交分享UI组件
                       DESC

  s.homepage         = 'https://github.com/axinger/AXSocialShareUI'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'axinger' => 'axinger@outlook.com' }
  s.source           = { :git => 'https://github.com/axinger/AXSocialShareUI.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'AXSocialShareUI/Classes/**/*'
  s.private_header_files = 'AXSocialShareUI/Classes/AXSocialShareUIPrivate.h'
   s.resource_bundles = {
     'AXSocialShareUI' => ['AXSocialShareUI/Assets/*.*']
   }
  s.dependency 'MonkeyKing', '~> 2.2.1'
  s.dependency 'AXViewControllerTransitioning', '~> 1.1.4'
  s.dependency 'Masonry','>= 1.0.0'
end
