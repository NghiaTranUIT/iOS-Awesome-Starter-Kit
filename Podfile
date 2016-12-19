#
#   Created by : Nghia Tran
#   Sun, 25th Sept 2016, Vietnam
#


source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
use_frameworks!


# Pods
def important_pods

    # Core
    pod 'Alamofire', '~> 4.0'
    pod 'ObjectMapper', '~> 2.2'
    pod 'ReSwift'
    pod 'PromiseKit', '~> 4.0'
    pod 'SwiftyBeaver'
    
    # Observable
    pod 'RxSwift',    '~> 3.0'
end


target "iOS-Starter-Kit" do
  important_pods
end


# iOS
post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '3.0'
    end
  end
end
