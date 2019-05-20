//
//  ViewController.swift
//  RxSwiftGooglePlus
//
//  Created by jayant patidar on 17/05/19.
//  Copyright © 2019 IntellArc. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import GoogleSignIn

class ViewController: UIViewController {

    @IBOutlet weak var googleLoginButton: UIButton!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var givenNameLabel: UILabel!
    @IBOutlet weak var familyNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var userIdLabel: UILabel!
    @IBOutlet weak var idTokenLabel: UILabel!
    
    @IBOutlet weak var signinButton: UIButton!
    @IBOutlet weak var signoutButton: UIButton!
    
    let viewModel = LoginViewModel()
    let disposeBag = DisposeBag()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        GIDSignIn.sharedInstance().uiDelegate = self
        
        // Uncomment to automatically sign in the user.
        //GIDSignIn.sharedInstance().signInSilently()
        
        // TODO(developer) Configure the sign-in button look/feel
        // ...
        
        if let _ = GIDSignIn.sharedInstance()?.hasAuthInKeychain() {
            print("login")
            let user = GIDSignIn.sharedInstance()?.currentUser
            print(user?.profile.email)
        }else{
            print("Not login")
        }
        
        setupBinding()
        setupButtonBinding()
    }

    
}

extension ViewController {
    func setupBinding() {
        viewModel.fullName.asObservable()
        .bind(to: fullNameLabel.rx.text)
        .disposed(by: disposeBag)
        
        viewModel.givenName.asObservable()
            .bind(to: givenNameLabel.rx.text)
            .disposed(by: disposeBag)
        
        viewModel.familyName.asObservable()
            .bind(to: familyNameLabel.rx.text)
            .disposed(by: disposeBag)
        
        viewModel.email.asObservable()
            .bind(to: emailLabel.rx.text)
            .disposed(by: disposeBag)
        
        viewModel.userId.asObservable()
            .bind(to: userIdLabel.rx.text)
            .disposed(by: disposeBag)
        
        viewModel.idToken.asObservable()
            .bind(to: idTokenLabel.rx.text)
            .disposed(by: disposeBag)
    }
    
    func setupButtonBinding() {
        signinButton.rx.tap
            .bind(to: viewModel.loginButtonPressed)
            .disposed(by: disposeBag)
        
        signoutButton.rx.tap
            .bind(to: viewModel.logoutButtonPressed)
            .disposed(by: disposeBag)
    }
}


extension ViewController: GIDSignInUIDelegate {
    
    // Implement these methods only if the GIDSignInUIDelegate is not a subclass of
    // UIViewController.
    
    // Stop the UIActivityIndicatorView animation that was started when the user
    // pressed the Sign In button
    func sign(inWillDispatch signIn: GIDSignIn!, error: Error?) {
        //myActivityIndicator.stopAnimating()
    }
    
    // Present a view that prompts the user to sign in with Google
    func sign(_ signIn: GIDSignIn!,
              present viewController: UIViewController!) {
        self.present(viewController, animated: true, completion: nil)
    }
    
    // Dismiss the "Sign in with Google" view
    func sign(_ signIn: GIDSignIn!,
              dismiss viewController: UIViewController!) {
        self.dismiss(animated: true, completion: nil)
    }
}
