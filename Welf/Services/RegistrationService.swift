//
//  RegistrationService.swift
//  Welf
//
//  Created by Clem on 05/06/2020.
//  Copyright © 2020 Clem. All rights reserved.
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
    
    public func isUsernameValid(username: String, completion: @escaping (Bool) -> ()) -> () {
        isUsernameAvailable(username: username, completion: completion)
    }
    
    private func isUsernameAvailable(username: String, completion: @escaping (Bool) -> ()) -> () {
        // see if this can be further incorrect to further ensure an error occurs?
        let confirmationCode: String = "000000"
        AWSMobileClient.default().confirmSignUp(username: username, confirmationCode: confirmationCode) { (signUpResult, error) in
            if let error = error as? AWSMobileClientError {
                switch error {
                case .notAuthorized(message: "User cannot be confirmed. Current status is CONFIRMED"):
                    print("RegistrationService: user exists")
                    completion(true)
                default:
                    print("RegistrationService: assume user doesn't exists")
                    completion(false)
                }
            }
        }
    }
    
    public func doesUsernameSatisfyconstraint(_ entry: String) -> Bool {
        print("isEntryValid \(entry)")
        let alphabetPattern = "^[a-zA-Z0-9_]+$"
        return !entry.isEmpty && entry.range(of: alphabetPattern, options: .regularExpression) != nil
    }
}
