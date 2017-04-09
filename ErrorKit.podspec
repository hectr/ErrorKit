Pod::Spec.new do |s|
  s.name         = "ErrorKit"
  s.version      = "1.0.0"
  s.summary      = "Error Kit is a handy iOS library for making NSError handling easier."
  s.description  = <<-DESC
  Error Kit is a handy iOS library for making NSError handling easier.
  
  It covers error object creation, inspection, presentation and recovery.
                   DESC
  s.homepage     = "https://github.com/hectr/ErrorKit"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = "Héctor Marqués Ranea"
  s.source       = { :git => "https://github.com/hectr/ErrorKit.git", :tag => s.version.to_s }
  s.platform     = :ios, '8.0'
  s.requires_arc = true
  
  s.source_files = 'ErrorKit/ErrorKit.h'

  s.default_subspec = 'Default'

  s.subspec 'Core' do |co|
    co.source_files = 'ErrorKit/Core'
    co.resources  = 'ErrorKit/Core/ErrorKit.bundle'
    co.xcconfig = { 'GCC_PREPROCESSOR_DEFINITIONS' => 'ERROR_KIT_CORE=1' }
  end

  s.subspec 'Additions' do |ad|
    ad.source_files = 'ErrorKit/Additions'
    ad.dependency 'ErrorKit/UIKit'
    ad.xcconfig = { 'GCC_PREPROCESSOR_DEFINITIONS' => 'ERROR_KIT_ADDITIONS=1' }
  end

  s.subspec 'Accounts' do |ac|
    ac.source_files = 'ErrorKit/Accounts'
    ac.dependency 'ErrorKit/Core'
    ac.ios.frameworks = 'Accounts'
    ac.xcconfig = { 'GCC_PREPROCESSOR_DEFINITIONS' => 'ERROR_KIT_ACCOUNTS=1' }
  end

  s.subspec 'AFNetworking' do |af|
    af.dependency 'ErrorKit/AFNetworking_v1'
  end

  s.subspec 'AFNetworking_v1' do |af1|
    af1.source_files = 'ErrorKit/AFNetworking'
    af1.dependency 'AFNetworking', '~> 1.3.3'
    af1.dependency 'ErrorKit/HTTP'
    af1.xcconfig = { 'GCC_PREPROCESSOR_DEFINITIONS' => 'ERROR_KIT_AFNETWORKING=1 ERROR_KIT_AFNETWORKING_V1=1' }
  end


  s.subspec 'AVFoundation' do |av|
    av.source_files = 'ErrorKit/AVFoundation'
    av.dependency 'ErrorKit/Core'
    av.ios.frameworks = 'AVFoundation'
    av.xcconfig = { 'GCC_PREPROCESSOR_DEFINITIONS' => 'ERROR_KIT_AVFOUNDATION=1' }
  end
  
  s.subspec 'CoreData' do |cd|
    cd.source_files = 'ErrorKit/CoreData'
    cd.dependency 'ErrorKit/NSException'
    cd.ios.frameworks = 'CoreData'
    cd.xcconfig = { 'GCC_PREPROCESSOR_DEFINITIONS' => 'ERROR_KIT_CORE_DATA=1' }
  end
  
  s.subspec 'CoreLocation' do |cl|
    cl.source_files = 'ErrorKit/CoreLocation'
    cl.dependency 'ErrorKit/Core'
    cl.ios.frameworks = 'CoreLocation'
    cl.xcconfig = { 'GCC_PREPROCESSOR_DEFINITIONS' => 'ERROR_KIT_CORE_LOCATION=1' }
  end

  s.subspec 'HTTP' do |ht|
    ht.source_files = 'ErrorKit/HTTP'
    ht.dependency 'ErrorKit/Core'
    ht.xcconfig = { 'GCC_PREPROCESSOR_DEFINITIONS' => 'ERROR_KIT_HTTP=1' }
  end

  s.subspec 'JSONValues' do |jv|
    jv.source_files = 'ErrorKit/JSONValues'
    jv.dependency 'ErrorKit/NSException'
    jv.xcconfig = { 'GCC_PREPROCESSOR_DEFINITIONS' => 'ERROR_KIT_JSON_VALUES=1' }
  end

  s.subspec 'JSONKit' do |jk|
    jk.source_files = 'ErrorKit/JSONKit'
    jk.dependency 'ErrorKit/Core'
    jk.xcconfig = { 'GCC_PREPROCESSOR_DEFINITIONS' => 'ERROR_KIT_JSON_KIT=1' }
  end
  
  s.subspec 'MapKit' do |mk|
    mk.source_files = 'ErrorKit/MapKit'
    mk.dependency 'ErrorKit/Core'
    mk.ios.frameworks = 'MapKit'
    mk.xcconfig = { 'GCC_PREPROCESSOR_DEFINITIONS' => 'ERROR_KIT_MAP_KIT=1' }
  end
  
  s.subspec 'MessageUI' do |mu|
    mu.source_files = 'ErrorKit/MessageUI'
    mu.dependency 'ErrorKit/Core'
    mu.ios.frameworks = 'MessageUI'
    mu.xcconfig = { 'GCC_PREPROCESSOR_DEFINITIONS' => 'ERROR_KIT_MESSAGE_UI=1' }
  end

  s.subspec 'NSException' do |ex|
    ex.source_files = 'ErrorKit/NSException'
    ex.dependency 'ErrorKit/Core'
    ex.xcconfig = { 'GCC_PREPROCESSOR_DEFINITIONS' => 'ERROR_KIT_NSEXCEPTION=1' }
  end

  s.subspec 'Parse' do |ps|
    ps.source_files = 'ErrorKit/Parse'
    ps.dependency 'ErrorKit/Core'
    ps.xcconfig = { 'GCC_PREPROCESSOR_DEFINITIONS' => 'ERROR_KIT_PARSE=1' }
  end

  s.subspec 'Security' do |se|
    se.source_files = 'ErrorKit/Security'
    se.dependency 'ErrorKit/Core'
    se.ios.frameworks = 'Security'
    se.xcconfig = { 'GCC_PREPROCESSOR_DEFINITIONS' => 'ERROR_KIT_SECURITY=1' }
  end
  
  s.subspec 'StoreKit' do |sk|
    sk.source_files = 'ErrorKit/StoreKit'
    sk.dependency 'ErrorKit/Core'
    sk.ios.frameworks = 'StoreKit'
    sk.xcconfig = { 'GCC_PREPROCESSOR_DEFINITIONS' => 'ERROR_KIT_STORE_KIT=1' }
  end
  
  s.subspec 'TransitionKit' do |tk|
    tk.source_files = 'ErrorKit/TransitionKit'
    tk.dependency 'TransitionKit', '< 1.2'
    tk.dependency 'ErrorKit/Core'
    tk.xcconfig = { 'GCC_PREPROCESSOR_DEFINITIONS' => 'ERROR_KIT_TRANSITION_KIT=1' }
  end
  
  s.subspec 'iAD' do |ia|
    ia.source_files = 'ErrorKit/iAD'
    ia.dependency 'ErrorKit/Core'
    ia.ios.frameworks = 'iAD'
    ia.xcconfig = { 'GCC_PREPROCESSOR_DEFINITIONS' => 'ERROR_KIT_IAD=1' }
  end

  s.subspec 'UIKit' do |ui|
    ui.source_files = 'ErrorKit/UIKit'
    ui.dependency 'ErrorKit/Core'
    ui.ios.frameworks = 'UIKit'
    ui.xcconfig = { 'GCC_PREPROCESSOR_DEFINITIONS' => 'ERROR_KIT_UI_KIT=1' }
  end

  s.subspec 'VeriJSON' do |vj|
    vj.source_files = 'ErrorKit/VeriJSON'
    vj.dependency 'VeriJSON', '< 0.2'
    vj.dependency 'ErrorKit/Core'
    vj.xcconfig = { 'GCC_PREPROCESSOR_DEFINITIONS' => 'ERROR_KIT_VERI_JSON=1' }
  end
  
  s.subspec 'Default' do |df|
    df.source_files = 'ErrorKit/Default'
    df.dependency 'ErrorKit/HTTP'
    df.dependency 'ErrorKit/JSONValues'
    df.dependency 'ErrorKit/NSException'
    df.dependency 'ErrorKit/Additions'
    df.xcconfig = { 'GCC_PREPROCESSOR_DEFINITIONS' => 'ERROR_KIT_DEFAULT=1' }
  end
end
