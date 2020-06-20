//
//  SignUpViewModelExtensions.swift
//  Welf
//
//  Created by Clement Oniovosa on 20/06/2020.
//  Copyright © 2020 Clement Oniovosa. All rights reserved.
//

import Combine

extension SignUpViewModel {
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
