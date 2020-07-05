//
// ContactDetailsService.swift
// Welf
//
//  Created by Clem on 01/07/2020.
// Copyright © 2020 Clem. All rights reserved.
//

import SwiftUI
import Combine

class SignUpContactDetailsService: ObservableObject {
    @Published var emailAddress: String = ""
    @Published var phoneNumber: String = ""
    
    public var isEmailAddressValidPublisher: AnyPublisher<Bool, Never> {
        self.$emailAddress
            .debounce(for: 0.2, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { input in
                self.isEntryValid(input)
        }
        .eraseToAnyPublisher()
    }
    
    public var isPhoneNumberValidPublisher: AnyPublisher<Bool, Never> {
        self.$phoneNumber
            .debounce(for: 0.2, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { input in
                input.count >= 9
        }
        .eraseToAnyPublisher()
    }
    
    public var isSignUpButtonDisabledPublisher: AnyPublisher<Bool, Never> {
        Publishers.CombineLatest(isEmailAddressValidPublisher, isPhoneNumberValidPublisher)
            .map { isEmailAddressValid, isPhoneNumberValid in
                return !(isEmailAddressValid && isPhoneNumberValid)
        }
        .eraseToAnyPublisher()
    }
    
    private func isEntryValid(_ entry: String) -> Bool {
        let alphabetPattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return !entry.isEmpty && entry.range(of: alphabetPattern, options: .regularExpression) != nil
    }
}
