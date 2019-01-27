source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '11.0'
use_frameworks!
inhibit_all_warnings!

target 'BitTicker' do
    # Pods for BitTicker
    
    #SVProgressHUD
    pod 'SVProgressHUD'
    
    #WebSocketSwift
    pod 'Starscream', '~> 3.0.2'
    
    #Firebase
    pod 'Firebase/Core'
    pod 'Firebase/Auth'
    
    #R.Swift
    pod 'R.swift'

  target 'BitTickerTests' do
    inherit! :search_paths
    # Pods for testing
  end
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['ENABLE_BITCODE'] = 'NO'
        end
    end
end
