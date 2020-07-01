//
// UsernameHelper.swift
// Welf
//
//  Created by Clem on 01/07/2020.
// Copyright © 2020 Clem. All rights reserved.
//

import SwiftUI
import AWSMobileClient

class UsernameHelper {
    public static func doesUsernameSatisfyconstraint(_ entry: String) -> Bool {
        let alphabetPattern = "^[a-zA-Z0-9_]+$"
        return entry.count > 4 && entry.range(of: alphabetPattern, options: .regularExpression) != nil
    }
    
    public static func isUsernameAvailable(username: String, completion: @escaping (Bool) -> ()) -> () {
        // see if this can be further incorrect to further ensure an error occurs?
        let confirmationCode: String = "000000"
        if !username.isEmpty {
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
    }
}
