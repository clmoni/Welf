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
    var goToNextPage: () -> ()
    
    var body: some View {
        let logInText = Text("Sign Up")
            .foregroundColor(Color.white)
            .bold()
        
        return GenericButton(
            buttonDisplayView: logInText,
            backgroundColour: signUpService.disableSignUpButton ? .secondary : .green
        ) { () in
            print(self.signUpService.emailAddress)
        }
        //.disabled(signUpViewModel.disableFirstPageNextButton)
        //.onReceive(signInViewModel.showSignInbutton) {
        //self.disableLoginButton = $0 ?? true
        //}
    }
}

struct SignUpButton_Previews: PreviewProvider {
    static var previews: some View {
        SignUpButton(goToNextPage: {}).environmentObject(SignUpService())
    }
}
