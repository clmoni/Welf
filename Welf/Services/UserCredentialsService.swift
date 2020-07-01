//
// UserCredentialsService.swift
// Welf
//
//  Created by Clem on 01/07/2020.
// Copyright © 2020 Clem. All rights reserved.
//

import SwiftUI
import Combine
import AWSMobileClient

class UserCredentialsService: ObservableObject {
    @Published public var username: String = ""
    @Published public var password: String = ""
    @Published var showPassword: Bool = false
    
    public var passwordStrengthPublisher: AnyPublisher<(PasswordStrengthMeter, String), Never> {
        $password
            .debounce(for: 0.2, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { input in
                return PasswordUtil.calculatePasswordStrength(input)
        }
        .eraseToAnyPublisher()
    }
    
    public var isNextButtonDisabledPublisher: AnyPublisher<Bool, Never> {
        Publishers.CombineLatest(validateUsernameEntryPublisher, passwordStrengthPublisher)
            .map { validateUsernameEntry, passwordStrength in
                let isPasswordStrengthAcceptable = (passwordStrength.0 == .amber || passwordStrength.0 == .green)
                if validateUsernameEntry == .valid && isPasswordStrengthAcceptable {
                    return false
                }
                return true
        }
        .eraseToAnyPublisher()
    }
    
    public var doesUsernameSatisfyConstraintPublisher: AnyPublisher<Bool, Never> {
        self.$username
            .debounce(for: 0.2, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { input in
                UsernameHelper.doesUsernameSatisfyconstraint(input)
        }
        .eraseToAnyPublisher()
    }
    
    public var doesUsernameAlreadyExistPublisher: AnyPublisher<Bool, Never> {
        self.$username
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .removeDuplicates()
            .flatMap{ input in
                return Future { promise in
                    UsernameHelper.isUsernameAvailable(username: input) { available in
                        promise(.success(available))
                    }
                }
        }
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher()
    }
    
    public var validateUsernameEntryPublisher: AnyPublisher<UsernameCheck, Never> {
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
}

