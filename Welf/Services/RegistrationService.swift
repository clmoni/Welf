//
//  RegistrationService.swift
//  Welf
//
//  Created by Clement Oniovosa on 05/06/2020.
//  Copyright © 2020 Clement Oniovosa. All rights reserved.
//

import Foundation
import AWSMobileClient 

struct RegistrationService {

    public func signUp (username: String, password: String, email: String, phoneNumber: String) {
        let userAttributes: [String: String] = ["email": email, "phone_number": phoneNumber]
        
        AWSMobileClient.default().signUp(username: username, password: password, userAttributes: userAttributes) { (signUpResult, error) in
            if let error = error as? AWSMobileClientError {
                print("\(error)")
            } else if let signUpResult = signUpResult {
                print("\(signUpResult)")
            }
        }
    }
}
