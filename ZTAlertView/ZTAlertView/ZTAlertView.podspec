Pod::Spec.new do |s|
	s.name = 'ZTAlertView'
	s.version = '0.1'
	s.license = 'MIT'
	s.summary = 'Test'
	s.homepage = ''
	s.author = { 'zt' => 'https://github.com/justzt' }
	s.source = { :git => '/Users/zt/Documents/git/ZTAlertView/ZTAlertView/ZTAlertView' }
#	s.source = { :git => "https://github.com/justzt/ZTAlertView.git", :tag => "0.1" }
	s.platform = :ios
	s.source_files = '*.{h,m}'
#	s.preserve_paths = '**/*.a'
#	s.library = 'Chartboost'
#	s.xcconfig = { 'LIBRARY_SEARCH_PATHS' => '"$(PODS_ROOT)/ChartboostSDK/Chartboost"' }
#	s.weak_frameworks = 'AdSupport', 'StoreKit'
#	s.frameworks = 'QuartzCore', 'SystemConfiguration', 'CoreGraphics'
end

