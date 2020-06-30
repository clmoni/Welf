//
//  PagedForm.swift
//  Welf
//
//  Created by Clem on 18/06/2020.
//  Copyright © 2020 Clem. All rights reserved.
//

import SwiftUI
import Foundation

struct PagedForm: View {
    @EnvironmentObject private var signUpService: SignUpService
    @State private var isValidUsername: Bool = false
    
    var body: some View {
        ZStack {
            if self.signUpService.currentPage == 1 {
                FirstStep()
            } else if self.signUpService.currentPage == 2 {
                VStack {
                    GenericTextFieldWithValidation(
                        text: self.$signUpService.username,
                        isValidEntry: self.$isValidUsername,
                        label: "User name"
                    ).onReceive(signUpService.validateUsernameEntryPublisher) {
                        let usernameCheck: UsernameCheck = $0
                        self.isValidUsername = usernameCheck == .valid
                    }
                    
                    GenericSecureField(
                        label: "Password",
                        showPassword: self.$signUpService.showPassword,
                        secureText: self.$signUpService.password
                    )
                }
                .transition(.move(edge: .leading))
            } else {
                VStack {
                    GenericTextField(label: "Email address", text: self.$signUpService.emailAddress)
                    GenericTextField(label: "Phone number", text: self.$signUpService.phoneNumber)
                }
                .transition(.move(edge: .leading))
            }
        }
    }
}

struct PagedForm_Previews: PreviewProvider {
    static var previews: some View {
        PagedForm().environmentObject(SignUpService())
    }
}

