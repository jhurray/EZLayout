Pod::Spec.new do |s|
  s.name     = 'EZLayout'
  s.version  = '0.1.0'
  s.author   = { 'Jeff Hurray' => 'jhurray33@gmail.com' }
  s.homepage = 'https://github.com/jhurray/EZLayout'
  s.summary  = 'A new take on iOS layouts using percentages. Imagine UIStackViews on crack. Goodbye autolayout.'
  s.license  = 'MIT'
  s.source   = { :git => 'https://github.com/jhurray/EZLayout.git', :tag => s.version.to_s }
  s.source_files = 'EZLayout/*{.h,.m}'
  s.platform = :ios
  s.ios.deployment_target = '6.0'
  s.requires_arc = true
end
