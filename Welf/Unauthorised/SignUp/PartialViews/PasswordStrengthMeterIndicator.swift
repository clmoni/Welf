//
// PasswordStrengthMeterIndicator.swift
// Welf
//
//  Created by Clem on 01/07/2020.
// Copyright © 2020 Clem. All rights reserved.
//

import SwiftUI

struct PasswordStrengthMeterIndicator: View {
    @Binding var passwordStrength: PasswordStrengthMeter
    
    var body: some View {
        ZStack {
            HStack {
                if $passwordStrength.wrappedValue == .red {
                    Rectangle().fill(Color.red).frame(height: 5)
                    Rectangle().stroke(Color.yellow).frame(height: 5)
                    Rectangle().stroke(Color.green).frame(height: 5)
                }
                else if $passwordStrength.wrappedValue == .amber {
                    Rectangle().fill(Color.red).frame(height: 5)
                    Rectangle().fill(Color.yellow).frame(height: 5)
                    Rectangle().stroke(Color.green).frame(height: 5)
                }
                else if $passwordStrength.wrappedValue == .green {
                    Rectangle().fill(Color.red).frame(height: 5)
                    Rectangle().fill(Color.yellow).frame(height: 5)
                    Rectangle().fill(Color.green).frame(height: 5)
                }
            }.animation(.easeInOut)
        }
    }
}

struct PasswordStrengthMeterIndicator_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE", "iPhone XS Max", "iPhone 8"], id: \.self) { deviceName in
            PasswordStrengthMeterIndicator(passwordStrength: .constant(.amber))
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .environment(\.colorScheme, .dark)
        }
    }
}
