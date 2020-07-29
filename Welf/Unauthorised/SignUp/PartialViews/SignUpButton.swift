//
//  SignUpButton.swift
//  Welf
//
//  Created by Clem on 18/06/2020.
//  Copyright © 2020 Clem. All rights reserved.
//

import SwiftUI

struct SignUpButton: View {
    @EnvironmentObject private var signUpService: SignUpService
    @EnvironmentObject private var nameService: SignUpNameService
    @EnvironmentObject private var userCredentialsService: SignUpUserCredentialsService
    @EnvironmentObject private var contactDetailsService: SignUpContactDetailsService
    @State private var disableSignUpButton: Bool = true
    
    var body: some View {
        let logInText = Text("Sign Up")
            .foregroundColor(Color.white)
            .bold()
        
        let isSuccessSignUpSubscriber = self.signUpService.$isSignUpSuccessful.sink(
            receiveValue: { isSuccessful in
                DispatchQueue.main.async {
                    if isSuccessful {
                        self.resetRegistration()
                    }
                }
        })
        
        return GenericButton(
            buttonDisplayView: logInText,
            backgroundColour: disableSignUpButton ? .secondary : .green
        ) { () in
            let signUpData = self.createSignUpDto()
            self.signUpService.signUp(signUpData)
        }
        .disabled(disableSignUpButton)
        .onReceive(contactDetailsService.isSignUpButtonDisabledPublisher) {
            self.disableSignUpButton = $0
        }
        .onDisappear(){
            isSuccessSignUpSubscriber.cancel()
        }
    }
    
    private func resetRegistration() {
        self.nameService.firstName = ""
        self.nameService.lastName = ""
        self.userCredentialsService.username = ""
        self.userCredentialsService.password = ""
        self.contactDetailsService.emailAddress = ""
        self.contactDetailsService.phoneNumber = ""
    }
    
    private func createSignUpDto() -> SignUpDto {
        SignUpDto(
            firstName: self.nameService.firstName,
            lastName: self.nameService.lastName,
            username: self.userCredentialsService.username,
            password: self.userCredentialsService.password,
            emailAddress: self.contactDetailsService.emailAddress,
            phoneNumber: self.contactDetailsService.phoneNumber
        )
    }
}

struct SignUpButton_Previews: PreviewProvider {
    static var previews: some View {
        SignUpButton()
            .injectSystemServices()
    }
}
