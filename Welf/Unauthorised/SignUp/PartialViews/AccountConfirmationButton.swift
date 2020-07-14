//
// AccountConfirmationButton.swift
// Welf
//
//  Created by Clem on 10/07/2020.
// Copyright © 2020 Clem. All rights reserved.
//

import SwiftUI

struct AccountConfirmationButton: View {
    var username: String
    @EnvironmentObject private var signUpService: SignUpService
    @EnvironmentObject private var authService: AuthenticationService
    @State private var disableAccountConfirmationButton: Bool = true
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>

    var body: some View {
        let logInText = Text("Confirm")
            .foregroundColor(Color.white)
            .bold()
        
        return GenericButton(
            buttonDisplayView: logInText,
            backgroundColour: disableAccountConfirmationButton ? .secondary : .green
        ) { () in
            let verificationDto = VerificationDto(username: self.username, confirmationCode: self.signUpService.verificationCode)
            self.signUpService.verifyAccountWithVerificationCode(
                verificationDto: verificationDto,
                authService: self.authService,
                presentationMode: self.presentationMode
            )
        }
        .disabled(disableAccountConfirmationButton)
        .alert(isPresented: $signUpService.errorOccurredOnVerification) {
            KeyboardResponder.dismissKeyboard()
            let titleText = Text(verbatim: "Oops!")
            let messageText =  Text(verbatim: "Looks like something went wrong on our side. We're on it.")
            let okBtnText = Text(verbatim: "OK")
            
            return Alert(title: titleText, message: messageText, dismissButton: .default(okBtnText))
        }
        .onReceive(signUpService.isVerificationCodeReadyToSendPublisher) { isVerificationCodeReadyToSend in
            self.disableAccountConfirmationButton = isVerificationCodeReadyToSend
        }
    }
}

struct AccountConfirmationButton_Previews: PreviewProvider {
    static var previews: some View {
        AccountConfirmationButton(username: "test")
            .injectSystemServices()
    }
}
