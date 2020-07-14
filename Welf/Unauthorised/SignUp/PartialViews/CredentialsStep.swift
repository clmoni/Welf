//
// SecondStep.swift
// Welf
//
//  Created by Clem on 01/07/2020.
// Copyright © 2020 Clem. All rights reserved.
//

import SwiftUI

struct CredentialsStep: View {
    @EnvironmentObject private var userCredentialsService: SignUpUserCredentialsService
    @State private var isValidUsername: Bool? = nil
    @State private var passwordStrength: PasswordStrengthMeter = .empty
    @State private var failureMessages: String = ""
    
    var body: some View {
        VStack {
            GenericTextFieldWithValidation(
                text: self.$userCredentialsService.username,
                isValidEntry: self.$isValidUsername,
                label: "User name",
                textContentType: .username
            ).onReceive(userCredentialsService.validateUsernameEntryPublisher) {
                let usernameCheck: UsernameCheck = $0
                self.isValidUsername = usernameCheck == .valid
            }
            
            GenericSecureField(
                label: "Password",
                showPassword: self.$userCredentialsService.showPassword,
                secureText: self.$userCredentialsService.password
            )
            
            PasswordStrengthMeterIndicator(
                passwordStrength: $passwordStrength
            ).onReceive(userCredentialsService.passwordStrengthPublisher) {
                self.passwordStrength = $0.0
                self.failureMessages = $0.1
                print("Errors: \n \($0.1)")
            }
            
            HStack {
                Text(verbatim: failureMessages).foregroundColor(.red)
                Spacer()
            }
        }
        .transition(.move(edge: .leading))
    }
}

struct CredentialsStep_Previews: PreviewProvider {
    static var previews: some View {
        CredentialsStep().environmentObject(SignUpUserCredentialsService())
    }
}
