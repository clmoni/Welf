//
// FinalStep.swift
// Welf
//
//  Created by Clem on 04/07/2020.
// Copyright © 2020 Clem. All rights reserved.
//

import SwiftUI

struct FinalStep: View {
    @EnvironmentObject private var contactDetailsService: SignUpContactDetailsService
    @State private var isValidEmail = false
    @State private var isValidPhoneNumber = false
    
    var body: some View {
        VStack {
            GenericTextFieldWithValidation(
                text: self.$contactDetailsService.emailAddress,
                isValidEntry: self.$isValidEmail,
                label: "Email address",
                textContentType: .emailAddress,
                keyboardType: .emailAddress
            ).onReceive(contactDetailsService.isEmailAddressValidPublisher) {
                self.isValidEmail = $0
            }
            
            GenericTextFieldWithValidation(
                text: self.$contactDetailsService.phoneNumber,
                isValidEntry: self.$isValidPhoneNumber,
                label: "Phone number",
                textContentType: .telephoneNumber,
                keyboardType: .phonePad
            ).onReceive(contactDetailsService.isPhoneNumberValidPublisher) {
                self.isValidPhoneNumber = $0
            }
        }
        .transition(.move(edge: .leading))
    }
}

struct FinalStep_Previews: PreviewProvider {
    static var previews: some View {
        FinalStep().environmentObject(SignUpContactDetailsService())
    }
}
