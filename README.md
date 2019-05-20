# RxSwiftGooglePlusDemo
After creat your project open your project path on terminal and run below mentioned these commands.
Set up your CocoaPods dependencies

to make a podfile
pod init

open your podfile
open podfile

paste pods in your podfile

--------------------------------------------------------------------------
# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'Your Project Name' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Your Project Name
   pod 'RxSwift'
   pod 'RxCocoa'
   pod 'GoogleSignIn'

  target 'YourProject NameTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'YourProject NameUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end
-------------------------------------------------------------------------------

install pod in project with
pod install


& run the project.

Thanks have a nice day.
