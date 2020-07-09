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
    @Published var isSigningUp: Bool = false
    @Published var isSignUpSuccessful: Bool = false
    @Published var confirmationCodeDestination: String? = nil
    
    var totalNumberOfPages: Int = 3
    var firstPage: Int = 1
    
    public func signUp (_ signUpData: SignUpDto) {
        let userAttributes = self.putSignUpDataInUserAttributeDictionary(signUpData)
        self.changeSigningUpState(isSigningUp: true)
        AWSMobileClient.default().signUp(username: signUpData.username, password: signUpData.password, userAttributes: userAttributes) { (signUpResult, error) in
            if let error = error as? AWSMobileClientError {
                print("\(error)")
            } else if let signUpResult = signUpResult {
                print("\(signUpResult)")
                self.isSignUpSuccessful = true
                self.confirmationCodeDestination = signUpResult.codeDeliveryDetails?.destination
            }
            self.changeSigningUpState(isSigningUp: false)
        }
    }
    
    private func putSignUpDataInUserAttributeDictionary (_ signUpData: SignUpDto) -> [String: String] {
        print(signUpData)
        return [
            "email": signUpData.emailAddress,
            "phone_number": signUpData.phoneNumber,
            "given_name": signUpData.firstName,
            "family_name": signUpData.lastName
        ]
    }
    
    private func changeSigningUpState(isSigningUp: Bool) {
        DispatchQueue.main.async {
            self.isSigningUp = isSigningUp
        }
    }
}
