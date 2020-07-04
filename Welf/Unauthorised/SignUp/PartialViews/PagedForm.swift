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
    @EnvironmentObject private var contactDetailsService: SignUpContactDetailsService
    @State private var isValidEmail = false
    
    var body: some View {
        ZStack {
            if self.signUpService.currentPage == 1 {
                FirstStep()
            } else if self.signUpService.currentPage == 2 {
                SecondStep()
            } else {
                VStack {
                    GenericTextFieldWithValidation(
                        text: self.$contactDetailsService.emailAddress,
                        isValidEntry: self.$isValidEmail,
                        label: "Email address"
                    ).onReceive(contactDetailsService.isEmailAddressValidPublisher) {
                        self.isValidEmail = $0
                    }
                    
                    GenericTextFieldWithValidation(
                        text: self.$contactDetailsService.phoneNumber,
                        isValidEntry: self.$isValidEmail,
                        label: "Phone number"
                    )
                }
                .transition(.move(edge: .leading))
            }
        }
    }
}

struct PagedForm_Previews: PreviewProvider {
    static var previews: some View {
        PagedForm()
            .modifier(SystemServices())
    }
}

