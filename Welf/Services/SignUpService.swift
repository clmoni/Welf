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

enum UsernameCheck {
    case valid
    case constraintViolation
    case alreadyExists
}

class SignUpService: ObservableObject {
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var emailAddress: String = ""
    @Published var phoneNumber: String = ""
    @Published var showPassword: Bool = false
    @Published var currentPage: Int = 1

    var disableFirstPageNextButton: Bool = true
    var disableSecondPageNextButton: Bool = true
    var disableSignUpButton: Bool = true
    var totalNumberOfPages: Int = 3
    var firstPage: Int = 1
    
    var isFirstPageNextButtonDisabledPublisher: AnyPublisher<Bool?, Never> {
        self.$firstName.combineLatest(self.$lastName) { firstName, lastName in
            return self.validateUserEntry(firstName, lastName)
        }
        .eraseToAnyPublisher()
    }
    
    var validateFirstNameEntryPublisher: AnyPublisher<String?, Never> {
        self.$firstName
            .debounce(for: 0.2, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { input in
                return !self.isEntryValid(input) ? "Only letters allowed" : ""
        }
        .eraseToAnyPublisher()
    }
    
    var validateLastNameEntryPublisher: AnyPublisher<String?, Never> {
        self.$lastName
            .debounce(for: 0.2, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { input in
                return !self.isEntryValid(input) ? "Only letters allowed" : ""
        }
        .eraseToAnyPublisher()
    }
    
    private func validateUserEntry(_ firstName: String, _ lastName: String) -> Bool {
        return !isEntryValid(firstName) || !isEntryValid(lastName)
    }
    
    private func isEntryValid(_ entry: String) -> Bool {
        let alphabetPattern = "^[a-zA-Z-'’]+$"
        return !entry.isEmpty && entry.range(of: alphabetPattern, options: .regularExpression) != nil
    }
    
    var doesUsernameSatisfyConstraintPublisher: AnyPublisher<Bool, Never> {
        self.$username
            .debounce(for: 0.2, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { input in
                self.doesUsernameSatisfyconstraint(input)
        }
        .eraseToAnyPublisher()
    }
    
    var doesUsernameAlreadyExistPublisher: AnyPublisher<Bool, Never> {
        self.$username
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .removeDuplicates()
            .flatMap{ input in
                return Future { promise in
                    self.isUsernameValid(username: input) { available in
                        promise(.success(available))
                    }
                }
        }
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher()
    }
    
    var validateUsernameEntryPublisher: AnyPublisher<UsernameCheck, Never> {
        Publishers.CombineLatest(doesUsernameSatisfyConstraintPublisher, doesUsernameAlreadyExistPublisher)
            .map { doesUsernameSatisfyConstraint, doesUsernameAlreadyExist in
                if !doesUsernameSatisfyConstraint {
                    return .constraintViolation
                }
                else if doesUsernameAlreadyExist {
                    return .alreadyExists
                }
                else {
                    return .valid
                }
        }
        .eraseToAnyPublisher()
    }
    
    public func doesUsernameSatisfyconstraint(_ entry: String) -> Bool {
        print("isEntryValid \(entry)")
        let alphabetPattern = "^[a-zA-Z0-9_]+$"
        return !entry.isEmpty && entry.range(of: alphabetPattern, options: .regularExpression) != nil
    }
    
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
}
