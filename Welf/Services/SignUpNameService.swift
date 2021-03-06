//
// NameService.swift
// Welf
//
//  Created by Clem on 01/07/2020.
// Copyright © 2020 Clem. All rights reserved.
//

import SwiftUI
import Combine
import AWSMobileClient

class SignUpNameService: ObservableObject {
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    
    var isFirstPageNextButtonDisabledPublisher: AnyPublisher<Bool, Never> {
        self.$firstName.combineLatest(self.$lastName) { firstName, lastName in
            self.validateUserEntry(firstName, lastName)
        }
        .eraseToAnyPublisher()
    }
    
    var validateFirstNameEntryPublisher: AnyPublisher<String?, Never> {
        self.$firstName
            .debounce(for: 0.2, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { input in
                !self.isEntryValid(input) ? "Only letters allowed" : ""
        }
        .eraseToAnyPublisher()
    }
    
    var validateLastNameEntryPublisher: AnyPublisher<String?, Never> {
        self.$lastName
            .debounce(for: 0.2, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { input in
                !self.isEntryValid(input) ? "Only letters allowed" : ""
        }
        .eraseToAnyPublisher()
    }
    
    
    private func validateUserEntry(_ firstName: String, _ lastName: String) -> Bool {
        !isEntryValid(firstName) || !isEntryValid(lastName)
    }
    
    private func isEntryValid(_ entry: String) -> Bool {
        let alphabetPattern = "^[a-zA-Z-'’]+$"
        return !entry.isEmpty && entry.range(of: alphabetPattern, options: .regularExpression) != nil
    }
}
