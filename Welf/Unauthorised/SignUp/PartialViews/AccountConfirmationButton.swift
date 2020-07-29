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
        
        let isSuccessfulVerificationSubscriber = self.signUpService.$isSuccessfulVerification.sink(
            receiveValue: { isSuccessful in
                DispatchQueue.main.async {
                    if isSuccessful {
                        print("success >>>> \(isSuccessful)")
                        self.authService.isSigningIn = false
                        self.authService.isSignedIn = true
                        self.reset()
                    }
                }
        })
        
        return GenericButton(
            buttonDisplayView: logInText,
            backgroundColour: disableAccountConfirmationButton ? .secondary : .green
        ) { () in
            self.presentationMode.wrappedValue.dismiss()
            self.authService.isSigningIn = true
            KeyboardResponder.dismissKeyboard()
            let verificationDto = VerificationDto(
                username: self.username,
                confirmationCode: self.signUpService.verificationCode
            )
            
            self.signUpService.verifyAccountWithVerificationCode(
                verificationDto: verificationDto
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
            print("input")
            self.disableAccountConfirmationButton = isVerificationCodeReadyToSend
        }
        .onDisappear {
            isSuccessfulVerificationSubscriber.cancel()
        }
    }
    
    private func reset() {
        self.signUpService.currentPage = 1
        self.authService.username = ""
        self.authService.password = ""
    }
}

struct AccountConfirmationButton_Previews: PreviewProvider {
    static var previews: some View {
        AccountConfirmationButton(username: "test")
            .injectSystemServices()
    }
}
