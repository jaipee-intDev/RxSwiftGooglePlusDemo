//
//  LoginViewModel.swift
//  RxSwiftGooglePlus
//
//  Created by jayant patidar on 17/05/19.
//  Copyright © 2019 IntellArc. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import GoogleSignIn

class LoginViewModel: NSObject{

    let disposeBag = DisposeBag()
    
    var loginButtonPressed = PublishSubject<Void>()
    var logoutButtonPressed = PublishSubject<Void>()
    
    let fullName    =  Variable<String>("")
    let givenName   =  Variable<String>("")
    let familyName  =  Variable<String>("")
    let email       =  Variable<String>("")
    let userId      =  Variable<String>("")
    let idToken     =  Variable<String>("")

    override init() {
        super.init()
        GIDSignIn.sharedInstance()?.delegate = self
        setupBindings()
    }
    
    func loginWithGooglePlus() {
        GIDSignIn.sharedInstance()?.signIn()
    }
    
    func logoutFromGooglePlus() {
        GIDSignIn.sharedInstance()?.disconnect()
    }
    
}

extension LoginViewModel {
    func setupBindings() {
        loginButtonPressed
            .subscribe(
                { [weak self] _ in
                    self?.loginWithGooglePlus()
                }
            )
            .disposed(by: disposeBag)
        
        logoutButtonPressed
            .subscribe(
                { [weak self] _ in
                    self?.logoutFromGooglePlus()
                }
            )
            .disposed(by: disposeBag)
    }
}


extension LoginViewModel: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            print("\(error.localizedDescription)")
        } else {

            
            let gpUser = GPLoginModel(user: user)
            print(gpUser)
            
            self.fullName.value = gpUser.fullName ?? ""
            self.givenName.value = gpUser.givenName ?? ""
            self.familyName.value = gpUser.familyName ?? ""
            self.email.value = gpUser.email ?? ""
            self.userId.value = gpUser.userId ?? ""
            self.idToken.value = gpUser.idToken ?? ""
        }
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        //
        print("logout")
    }
}
