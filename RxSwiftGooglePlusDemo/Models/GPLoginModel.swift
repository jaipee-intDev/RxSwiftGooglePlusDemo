//
//  GooglePlusLoginModel.swift
//  RxSwiftGooglePlus
//
//  Created by jayant patidar on 17/05/19.
//  Copyright © 2019 IntellArc. All rights reserved.
//

import Foundation
import GoogleSignIn
struct GPLoginModel: Codable {
    
    let userId: String?
    let idToken: String?
    let fullName: String?
    let givenName: String?
    let familyName: String?
    let email: String?
    
    init(user: GIDGoogleUser?) {
        // Perform any operations on signed in user here.
        self.userId = user?.userID                  // For client-side use only!
        self.idToken = user?.authentication.idToken // Safe to send to the server
        self.fullName = user?.profile.name
        self.givenName = user?.profile.givenName
        self.familyName = user?.profile.familyName
        self.email = user?.profile.email
        // ...
    }
}
