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
    s.description      = <<-DESC
    依赖于MonkeyKing(因为OC不能直接调用),制作的社会化社交分享UI组件
    DESC
    
    s.homepage         = 'https://github.com/axinger/AXSocialShareUI'
    # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'axinger' => 'axinger@outlook.com' }
    s.source           = { :git => 'https://github.com/axinger/AXSocialShareUI.git', :tag => s.version.to_s }
    
    s.static_framework  =  false
    s.swift_version = '5.0'
    s.ios.deployment_target = '9.0'
    s.source_files = 'AXSocialShareUI/Classes/**/*.{h,m,swift}'
    s.public_header_files = 'AXSocialShareUI/Classes/AXSocialShareUI.h'
    s.private_header_files = 'AXSocialShareUI/Classes/AXSocialShareUIPrivate.h'
    s.resource_bundles = {
        'AXSocialShareUI' => ['AXSocialShareUI/Assets/*.*']
    }
    s.dependency 'MonkeyKing'
    s.dependency 'AXViewControllerTransitioning'
    s.dependency 'Masonry'
end
