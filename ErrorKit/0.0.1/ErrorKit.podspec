Pod::Spec.new do |s|
  s.name         = "ErrorKit"
  s.version      = "0.0.1"
  s.summary      = "Error Kit is a handy iOS library for making NSError handling easier."
  s.description  = <<-DESC
  Error Kit is a handy iOS library for making NSError handling easier.
  
  It covers error object creation, inspection, presentation and recovery.
                   DESC
  s.homepage     = "https://github.com/hectr/ErrorKit"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = "Héctor Marqués Ranea"
  s.source       = { :git => "https://github.com/hectr/ErrorKit.git", :commit => '3e2be01e8bdbd0f10f60fca3549ddb206d470b6f' }
  s.platform     = :ios, '5.0'
  s.requires_arc = true
  
  s.preferred_dependency = 'Core'
  
  s.subspec 'Core' do |c|
    c.source_files = 'ErrorKit'
  end
  
  s.subspec 'AFNetworking' do |af|
    af.source_files = 'ErrorKit/AFNetworking'
    af.dependency   'AFNetworking', '~> 1.1.0'
  end
  
  s.subspec 'Accounts' do |ac|
    ac.source_files     = 'ErrorKit/Accounts'
    ac.ios.frameworks = 'Accounts'
  end
  
  s.subspec 'Admob' do |ad|
    ad.source_files = 'ErrorKit/Admob'
  end
  
  s.subspec 'CoreData' do |cd|
    cd.source_files = 'ErrorKit/CoreData'
    cd.frameworks = 'CoreData'
  end
  
  s.subspec 'CoreLocation' do |cl|
    cl.source_files = 'ErrorKit/CoreLocation'
    cl.frameworks = 'CoreLocation'
  end
  
  s.subspec 'FacebookSDK' do |fb|
    fb.source_files = 'ErrorKit/FacebookSDK'
    fb.dependency   'Facebook-iOS-SDK', '3.2.1'
  end
  
  s.subspec 'HTTP' do |http|
    http.source_files = 'ErrorKit/HTTP'
  end
  
  s.subspec 'JSONKit' do |jk|
    jk.source_files = 'ErrorKit/JSONKit'
  end
  
  s.subspec 'MapKit' do |mk|
    mk.source_files     = 'ErrorKit/MapKit'
    mk.ios.frameworks = 'MapKit'
  end
  
  s.subspec 'MessageUI' do |mui|
    mui.source_files     = 'ErrorKit/MessageUI'
    mui.ios.frameworks = 'MessageUI'
  end
  
  s.subspec 'Security' do |sec|
    sec.source_files     = 'ErrorKit/Security'
    sec.ios.frameworks = 'Secruity'
  end
  
  s.subspec 'StoreKit' do |sk|
    sk.source_files = 'ErrorKit/StoreKit'
    sk.ios.frameworks = 'StoreKit'
  end
  
  s.subspec 'TransitionKit' do |tk|
    tk.source_files = 'ErrorKit/TransitionKit'
    tk.dependency   'TransitionKit', '1.0.0'
  end
  
  s.subspec 'iAD' do |iad|
    iad.source_files     = 'ErrorKit/iAD.h'
    iad.ios.frameworks = 'iAD'
  end
end
