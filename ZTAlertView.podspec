Pod::Spec.new do |s|
	s.name = 'ZTAlertView'
	s.version = '1.0'
	s.license = 'MIT'
	s.summary = 'An ios custom alertView implement with UIView'
	s.homepage = 'https://github.com/justzt/ZTAlertView'
	s.author = { 'justzt' => 'justzt@gmail.com' }
	s.source = { :git => 'https://github.com/justzt/ZTAlertView.git' }
	s.platform = :ios
	s.source_files = 'ZTAlertView/ZTAlertView/*.{h,m}'
#	s.preserve_paths = '**/*.a'
#	s.library = 'Chartboost'
#	s.xcconfig = { 'LIBRARY_SEARCH_PATHS' => '"$(PODS_ROOT)/ChartboostSDK/Chartboost"' }
#	s.weak_frameworks = 'AdSupport', 'StoreKit'
#	s.frameworks = 'QuartzCore', 'SystemConfiguration', 'CoreGraphics'
end
