//
// AccountConfirmationStep.swift
// Welf
//
//  Created by Clem on 10/07/2020.
// Copyright © 2020 Clem. All rights reserved.
//

import SwiftUI

struct AccountConfirmationStep: View {
    public var confirmationCodeDestination: String
    @EnvironmentObject private var signUpService: SignUpService
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(verbatim: "We have sent a code by email to \(self.confirmationCodeDestination). Enter it below to confirm your account.")
                .font(.system(size: 20))
                .foregroundColor(.gray)
                .lineLimit(3)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            GenericTextField(
                label: "Verification code",
                text: self.$signUpService.verificationCode,
                textContentType: .oneTimeCode,
                keyboardType: .numberPad
            )
            //                    .onReceive(contactDetailsService.isPhoneNumberValidPublisher) {
            //                    self.isValidPhoneNumber = $0
            //                    if $0 {
            //                        self.phoneNumberFormatHint = ""
            //                    }
            //                }.onTapGesture {
            //                    self.phoneNumberFormatHint = "UK only"
            //                }
        }
    }
}

struct AccountConfirmationStep_Previews: PreviewProvider {
    static var previews: some View {
        AccountConfirmationStep(confirmationCodeDestination: "test@test.com")
            .environmentObject(SignUpService())
    }
}
