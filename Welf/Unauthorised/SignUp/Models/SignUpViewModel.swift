//
//  SignUpViewModel.swift
//  Welf
//
//  Created by Clement Oniovosa on 09/06/2020.
//  Copyright © 2020 Clement Oniovosa. All rights reserved.
//

import SwiftUI
import Combine

class SignUpViewModel: ObservableObject {
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
        $firstName.combineLatest($lastName) { firstName, lastName in
            return self.validateUserEntry(firstName, lastName)
        }
        .eraseToAnyPublisher()
    }
    
    private func validateUserEntry(_ firstName: String, _ lastName: String) -> Bool {
        let alphabetPattern = "^[a-zA-Z-'’]+$"
        let isEitherFirstOrLastNameEmpty = firstName.isEmpty || lastName.isEmpty
     
        let isEitherFirstOrLastNameContainingNonLetters =
            firstName.range(of: alphabetPattern, options: .regularExpression) == nil ||
                lastName.range(of: alphabetPattern, options: .regularExpression) == nil

        return isEitherFirstOrLastNameEmpty || isEitherFirstOrLastNameContainingNonLetters
    }
}
