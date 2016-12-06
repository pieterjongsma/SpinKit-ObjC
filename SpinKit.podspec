Pod::Spec.new do |s|
  s.name         = 'SpinKit'
  s.version      = '1.2.0'
  s.authors      = {'Ramon Torres' => 'raymondjavaxx@gmail.com', 'Pieter Jongsma' => 'pieter.jongsma@gmail.com'}
  s.homepage     = 'https://github.com/pieterjongsma/SpinKit-ObjC'
  s.summary      = 'UIActivityIndicatorView replacement with multiple styles and animations.'
  s.source       = {:git => 'https://github.com/pieterjongsma/SpinKit-ObjC.git', :tag => '1.2.0'}
  s.license      = {:type => 'MIT', :file => 'LICENSE'}
  s.platform     = :ios, '6.0'
  s.public_header_files = 'SpinKit/RTSpinKitView.h', 'SpinKit/RTSpinKitAnimating.h'
  s.source_files = 'SpinKit/**/*.{m,h}'
  s.requires_arc = true
end
