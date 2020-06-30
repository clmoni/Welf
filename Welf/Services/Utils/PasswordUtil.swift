//
// PasswordUtil.swift
// Welf
//
//  Created by Clem on 01/07/2020.
// Copyright © 2020 Clem. All rights reserved.
//

import Navajo_Swift

struct PasswordUtil {
    static func calculatePasswordStrength(_ password: String) -> PasswordStrengthMeter {
        
        var meter: PasswordStrengthMeter
        
        switch Navajo.strength(ofPassword: password) {
        case .strong, .veryStrong:
            meter = .green
        case .reasonable:
            meter = .amber
        default:
            meter = .amber
        }
        
        return meter
    }
}
