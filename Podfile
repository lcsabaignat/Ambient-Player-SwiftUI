platform :ios, '13.0'

source 'git@git.vzbuilders.com:TacoCorp/devops-cocoapods.git'

target 'Ambient' do
  use_frameworks!
  project "Ambient/Ambient.xcproj"
  pod 'Verizon-Ads-StandardEdition', '~>1.11.0-beta'
end

post_install do |installer_representation|
  installer_representation.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['ONLY_ACTIVE_ARCH'] = 'NO'
    end
  end
end
