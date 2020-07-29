//
// FinalStep.swift
// Welf
//
//  Created by Clem on 04/07/2020.
// Copyright © 2020 Clem. All rights reserved.
//

import SwiftUI

struct ContactDetailsStep: View {
    @EnvironmentObject private var contactDetailsService: SignUpContactDetailsService
    @State private var isValidEmail: Bool? = nil
    @State private var isValidPhoneNumber: Bool? = nil
    @State private var phoneNumberFormatHint: String = ""
    
    var body: some View {
        VStack {
            GenericTextFieldWithValidation(
                text: self.$contactDetailsService.emailAddress,
                isValidEntry: self.$isValidEmail,
                label: "Email address",
                textContentType: .emailAddress,
                keyboardType: .emailAddress
            ).onReceive(contactDetailsService.isEmailAddressValidPublisher) { isEmailAddressValid in
                self.isValidEmail = isEmailAddressValid
            }
            
            GenericTextFieldWithValidation(
                text: self.$contactDetailsService.phoneNumber,
                isValidEntry: self.$isValidPhoneNumber,
                label: "Mobile number",
                textContentType: .telephoneNumber,
                keyboardType: .phonePad
            ).onReceive(contactDetailsService.isPhoneNumberValidPublisher) { isPhoneNumberValid in
                self.isValidPhoneNumber = isPhoneNumberValid
                if isPhoneNumberValid {
                    self.phoneNumberFormatHint = ""
                }
            }.onTapGesture {
                self.phoneNumberFormatHint = "UK only"
            }
            
            HStack {
                Text(verbatim: phoneNumberFormatHint).foregroundColor(.green).font(.footnote)
                Spacer()
            }
        }
        .transition(.move(edge: .leading))
        .onTapGesture {
            self.phoneNumberFormatHint = ""
        }
    }
}

struct ContactDetailsStep_Previews: PreviewProvider {
    static var previews: some View {
        ContactDetailsStep().environmentObject(SignUpContactDetailsService())
    }
}
