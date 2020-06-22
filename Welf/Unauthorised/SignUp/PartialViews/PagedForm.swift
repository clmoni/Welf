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
    @ObservedObject var signUpViewModel: SignUpViewModel
    @State private var isValidUsername: Bool = false
    
    var body: some View {
        ZStack {
            if self.signUpViewModel.currentPage == 1 {
                FirstStep(signUpViewModel: self.signUpViewModel)
            } else if self.signUpViewModel.currentPage == 2 {
                VStack {
                    GenericTextFieldWithValidation(
                        text: self.$signUpViewModel.username,
                        isValidEntry: self.$isValidUsername,
                        label: "User name"
                    ).onReceive(signUpViewModel.validateUsernameEntryPublisher) {
                        guard let validationMessage = $0 else {
                            return
                        }
                        self.isValidUsername = !(validationMessage.count > 0)
                    }
                    
                    GenericSecureField(
                        label: "Password",
                        showPassword: self.$signUpViewModel.showPassword,
                        secureText: self.$signUpViewModel.password
                    )
                }
                .transition(.move(edge: .leading))
            } else {
                VStack {
                    GenericTextField(label: "Email address", text: self.$signUpViewModel.emailAddress)
                    GenericTextField(label: "Phone number", text: self.$signUpViewModel.phoneNumber)
                }
                .transition(.move(edge: .leading))
            }
        }
    }
}

struct PagedForm_Previews: PreviewProvider {
    static var previews: some View {
        PagedForm(signUpViewModel: .init())
    }
}

