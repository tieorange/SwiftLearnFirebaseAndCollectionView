# Uncomment the next line to define a global platform for your project
platform :ios, '8.0'

target 'LearnFirebaseTry2' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for LearnF
  pod 'Firebase/Core'
  pod 'Firebase/Database'
  pod 'FirebaseUI/Database', '~> 3.0'
  pod 'Kingfisher', '~> 3.0'
  pod 'RealmSwift'
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '3.0'
    end
  end
end