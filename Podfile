
platform :ios, '9.0'
use_frameworks!
 
target 'RXSwift Project' do
 
pod 'RxSwift'
pod 'RxCocoa'
pod 'ChameleonFramework/Swift', :git => 'https://github.com/ViccAlexander/Chameleon.git'
 
end
 
post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
              config.build_settings['ENABLE_TESTABILITY'] = 'YES'
              config.build_settings['SWIFT_VERSION'] = '5.0'
        end
    end
end