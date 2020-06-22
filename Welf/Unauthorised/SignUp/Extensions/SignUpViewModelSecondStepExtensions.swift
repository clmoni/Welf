//
// SignUpViewModelSecondStepExtensions.swift
// Welf
//
//  Created by Clem on 21/06/2020.
// Copyright © 2020 Clem. All rights reserved.
//

import SwiftUI
import Combine

extension SignUpViewModel {
    var validateUsernameEntryPublisher: AnyPublisher<String?, Never> {
        self.$username
            .debounce(for: 0.2, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { input in
                return !self.isEntryValid(input) ? "Only a-z, 0-9 and _ allowed" : ""
        }
        .eraseToAnyPublisher()
    }
    
    private func isEntryValid(_ entry: String) -> Bool {
        let alphabetPattern = "^[a-zA-Z0-9_]+$"
        return !entry.isEmpty && entry.range(of: alphabetPattern, options: .regularExpression) != nil
    }
}
