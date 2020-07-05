//
//  SignUpViewModel.swift
//  Welf
//
//  Created by Clem on 09/06/2020.
//  Copyright © 2020 Clem. All rights reserved.
//

import SwiftUI
import Combine
import AWSMobileClient

class SignUpService: ObservableObject {
    @Published var currentPage: Int = 1
    var totalNumberOfPages: Int = 3
    var firstPage: Int = 1
    
    public func signUp (_ signUpData: SignUpDto) {
        let userAttributes: [String: String] = [
            "email": signUpData.emailAddress,
            "phone_number": signUpData.phoneNumber,
            "first_name": signUpData.firstName,
            "last_name": signUpData.lastName
        ]
        //self.changeSigningInState(isSigningIn: true)
        AWSMobileClient.default().signUp(username: signUpData.username, password: signUpData.password, userAttributes: userAttributes) { (signUpResult, error) in
            if let error = error as? AWSMobileClientError {
                print("\(error)")
            } else if let signUpResult = signUpResult {
                print("\(signUpResult)")
            }
            //self.changeSigningInState(isSigningIn: false)
        }
    }
}
