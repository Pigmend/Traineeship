# Uncomment the next line to define a global platform for your project
platform :ios, '12.0'

target 'traineeApplicationPokrovskyIlya' do
  use_frameworks!

	pod 'SwiftGifOrigin'
  pod 'R.swift', '~> 4.0.0'
  pod 'SwiftLint', '~> 0.32.0'
  
  pod 'Firebase/Core', '~> 5.20.1'
  pod 'Firebase/Storage'
  pod 'Firebase/Database'
  pod 'Firebase/Firestore'
  pod 'Firebase/Analytics'
  pod 'FirebaseUI/Auth'
  pod 'FirebaseUI/Email'
  pod 'FirebaseUI/Google'
  pod 'CodableFirebase'
  
  pod 'SideMenu', '~> 5.0.3'
  pod 'AppusViper', :git => 'git@gitlab.appus.software:ios/VIPER-template.git', :branch => '2.0.0'
  pod 'Kingfisher', '~> 4.0.0'
  pod 'IQKeyboardManagerSwift', '6.0.4'
  pod 'PKHUD', '~> 5.0.0'
  
end

post_install do |installer|
  installer.pods_project.build_configurations.each do |config|
    config.build_settings.delete('CODE_SIGNING_ALLOWED')
    config.build_settings.delete('CODE_SIGNING_REQUIRED')
  end
  
  installer.pods_project.targets.each do |target|
    if ['ImagePicker', 'Viewer', 'DropDown', 'PKHUD'].include? target.name
      target.build_configurations.each do |config|
        config.build_settings['SWIFT_VERSION'] = '4.0'
      end
    end
  end
end
