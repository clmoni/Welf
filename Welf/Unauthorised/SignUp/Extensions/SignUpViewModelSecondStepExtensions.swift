//
// SignUpViewModelSecondStepExtensions.swift
// Welf
//
//  Created by Clem on 21/06/2020.
// Copyright © 2020 Clem. All rights reserved.
//

import SwiftUI
import Combine

enum UsernameCheck {
    case valid
    case constraintViolation
    case alreadyExists
}

extension SignUpViewModel {
    private var registrationService: RegistrationService {
        get {
            return RegistrationService()
        }
    }
    
    var doesUsernameSatisfyConstraintPublisher: AnyPublisher<Bool, Never> {
        self.$username
            .debounce(for: 0.2, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { input in
                self.registrationService.doesUsernameSatisfyconstraint(input)
        }
        .eraseToAnyPublisher()
    }
    
    var doesUsernameAlreadyExistPublisher: AnyPublisher<Bool, Never> {
        self.$username
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .removeDuplicates()
            .flatMap{ input in
                return Future { promise in
                    self.registrationService.isUsernameValid(username: input) { available in
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
}
