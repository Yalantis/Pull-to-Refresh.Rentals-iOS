Pod::Spec.new do |s|
  s.name    = 'YALTourPullToRefresh'
  s.version = '1.0.0'
  s.license = { :type => 'Apache Version 2.0' }
  s.summary = 'A simple and customizable pull to refresh implementation.'
  s.homepage = 'https://yalantis.com/'
  s.authors = {
    'Yalantis' => 'hello@yalantis.com',
    'timominous' => 'timominous@gmail.com',
  }

  s.source = {
    :git => 'https://github.com/Yalantis/Pull-to-Refresh.Rentals-iOS.git'
  }

  s.platform = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'YALTourPullToRefresh/YALSunnyRefreshControll/**/*.{h,m}'
  s.preserve_path = '*'
  s.resources = ['YALTourPullToRefresh/YALSunnyRefreshControll/**/*.xib']

end
  
