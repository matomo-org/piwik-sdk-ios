Pod::Spec.new do |s|
  s.name         = "PiwikTracker"
  s.version      = "2.5.2"
  s.summary      = "A Piwik tracker written in Objective-C for iOS and OSX apps."
  s.homepage     = "https://github.com/piwik/piwik-sdk-ios/"
  s.license      = { :type => 'MIT', :file => 'LICENSE.md' }
  s.author       = { "Mattias Levin" => "mattias.levin@gmail.com" }
  s.source       = { :git => "https://github.com/piwik/piwik-sdk-ios.git", :tag => "v#{s.version}" }
  s.ios.deployment_target = '7.0'
  s.osx.deployment_target = '10.8'
  s.requires_arc = true
  s.default_subspecs = 'Core'
  
  spec.subspec 'Core' do |core|
  	core.ios.source_files = 'PiwikTracker/*.{h,m,xcdatamodeld}'
 	core.osx.exclude_files = 'PiwikTracker/PiwikTrackedViewController.{h,m}'
  	core.ios.frameworks = 'Foundation', 'UIKit', 'CoreData', 'CoreLocation', 'CoreGraphics'
  	core.osx.frameworks = 'Foundation', 'Cocoa', 'CoreData', 'CoreGraphics'
  end
  
  spec.subspec 'AFNetworkingv1' do |afnetworkingv1|
      afnetworkingv1.source_files   = 'PiwikTracker+AFNetworkingv1/*.{h,m,}'
	  afnetworkingv1.dependency 'AFNetworking', '1.3.2'
      afnetworkingv1.dependency 'PiwikTracker/Core'
  end
  
end
