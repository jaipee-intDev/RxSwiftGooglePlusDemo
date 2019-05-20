//
//  GPServices.swift
//  RxSwiftGooglePlus
//
//  Created by jayant patidar on 20/05/19.
//  Copyright © 2019 IntellArc. All rights reserved.
//

import Foundation
import GoogleSignIn

struct GPServices {
    static let shared = GPServices()
    func startService() {
        GIDSignIn.sharedInstance().clientID = GPCredentials.getClientId()
    }
    
    func handel(open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:])-> Bool {
        return GIDSignIn.sharedInstance().handle(url as URL?,
                                          sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,
                                          annotation: options[UIApplication.OpenURLOptionsKey.annotation])
    }
}


private struct GPCredentials {
    //static let shared = GPCredentials()
    private static let clientId = "put your clientId here."
    
    static func getClientId()-> String {
        return self.clientId
    }
}
