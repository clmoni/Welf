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
    
    var disableFirstPageNextButton: Bool = true
    @State var disableSecondPageNextButton: Bool = true
    var disableSignUpButton: Bool = true
    var totalNumberOfPages: Int = 3
    var firstPage: Int = 1

    
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
