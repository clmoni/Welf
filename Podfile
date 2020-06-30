# Uncomment the next line to define a global platform for your project
platform :ios, '13.5'

target 'Welf' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  pod 'Navajo-Swift'

  # Pods for Welf
  pod 'AWSCore', '~> 2.13.0'
  pod 'AWSMobileClient', '~> 2.13.0'      # Required dependency
  pod 'AWSAuthUI', '~> 2.13.0'            # Optional dependency required to use drop-in UI
  pod 'AWSUserPoolsSignIn', '~> 2.13.0'   # Optional dependency required to use drop-in UI
  pod 'AWSAppSync', '~> 3.1.2'
  pod 'AWSS3', '~> 2.13.0'

  target 'WelfTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'WelfUITests' do
    # Pods for testing
  end

end
