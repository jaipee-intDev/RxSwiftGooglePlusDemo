# RxSwiftGooglePlusDemo
After creat your project open your project path on terminal and run below mentioned these commands.
Set up your CocoaPods dependencies

to make a podfile
pod init

open your podfile
open podfile

paste pods in your podfile

--------------------------------------------------------------------------
```
target 'ProjectName' do
  use_frameworks!

   pod 'RxSwift'
   pod 'RxCocoa'
   pod 'GoogleSignIn'

end
```
-------------------------------------------------------------------------------

install pod in project with
pod install


for creating an OAuth client ID refer this url
https://developers.google.com/identity/sign-in/ios/start-integrating

create project and get client ID & download and save credential.plist and drag and drop in xcode project.

paste client ID in GPServices.Swift file 

```
private struct GPCredentials {
    //static let shared = GPCredentials()
    private static let clientId = "put your clientId here."
    
    static func getClientId()-> String {
        return self.clientId
    }
}
```

then open credentials.plist and copy REVERSED CLIENT ID like :- com.googleusercontent.apps.67xxxxx14xx-hj2jgqhucxxxxxxxxxjaad1tobxxxxxx

and open target click on info tab and add new URL Types and past this reverse client ID in URL Schemes text field in it.
for refrence see this page https://developers.google.com/identity/sign-in/ios/start-integrating

& run the project.

Thanks have a nice day.
