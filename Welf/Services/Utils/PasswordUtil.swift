//
// PasswordUtil.swift
// Welf
//
//  Created by Clem on 01/07/2020.
// Copyright © 2020 Clem. All rights reserved.
//

import Navajo_Swift

struct PasswordUtil {
    static func calculatePasswordStrength(_ password: String) -> (PasswordStrengthMeter, String) {
        var meter: PasswordStrengthMeter = .empty
        var failureMessages = ""
        if !password.isEmpty {
            let validator = createPasswordValidator()
            let failingRules = validator.validate(password)
            switch failingRules?.isEmpty ?? true ? Navajo.strength(ofPassword: password) : .veryWeak {
            case .veryStrong:
                meter = .green
            case .reasonable, .strong:
                meter = .amber
            default:
                meter = .red
                failureMessages = createValidationFailureMessages(failingRules: failingRules)
            }
        }
        return (meter, failureMessages)
    }
    
    private static func createPasswordValidator() -> PasswordValidator {
        let lengthRule = LengthRule(min: 8, max: 30)
        let lowercaseRule = RequiredCharacterRule(preset: .lowercaseCharacter)
        let uppercaseRule = RequiredCharacterRule(preset: .uppercaseCharacter)
        let symbolRule = RequiredCharacterRule(preset: .symbolCharacter)
        
        return PasswordValidator(rules: [lengthRule, lowercaseRule, uppercaseRule, symbolRule])
    }
    
    private static func createValidationFailureMessages(failingRules: [PasswordRule]?) -> String {
        var failureMessages: String = ""
        if let rules = failingRules {
            failureMessages = rules.map({ return "* \($0.localizedErrorDescription)" }).joined(separator: "\n")
        }
        return failureMessages
    }
}
