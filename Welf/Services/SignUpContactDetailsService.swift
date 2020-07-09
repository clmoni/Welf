//
// ContactDetailsService.swift
// Welf
//
//  Created by Clem on 01/07/2020.
// Copyright © 2020 Clem. All rights reserved.
//

import SwiftUI
import Combine
import PhoneNumberKit

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
                self.isPhoneNumberValid(input)
        }
        .eraseToAnyPublisher()
    }
    
    public var isSignUpButtonDisabledPublisher: AnyPublisher<Bool, Never> {
        Publishers.CombineLatest(isEmailAddressValidPublisher, isPhoneNumberValidPublisher)
            .map { isEmailAddressValid, isPhoneNumberValid in
                !(isEmailAddressValid && isPhoneNumberValid)
        }
        .eraseToAnyPublisher()
    }
    
    private func isPhoneNumberValid(_ phoneNumber: String) -> Bool {
        let phoneNumberKit = PhoneNumberKit();
        return (try? phoneNumberKit.parse(phoneNumber)) != nil
    }
    
    private func isEntryValid(_ entry: String) -> Bool {
        let alphabetPattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return !entry.isEmpty && entry.range(of: alphabetPattern, options: .regularExpression) != nil
    }
}
