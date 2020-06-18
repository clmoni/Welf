//
//  SignUpButton.swift
//  Welf
//
//  Created by Clement Oniovosa on 18/06/2020.
//  Copyright © 2020 Clement Oniovosa. All rights reserved.
//

import SwiftUI

struct SignUpButton: View {
    @ObservedObject var signUpViewModel: SignUpViewModel
    var goToNextPage: () -> ()
    
    var body: some View {
        let logInText = Text("Sign Up")
            .foregroundColor(Color.white)
            .bold()
        
        return GenericButton(
            buttonDisplayView: logInText,
            backgroundColour: signUpViewModel.disableSignUpButton ? .secondary : .green
        ) { () in
            print(self.signUpViewModel.emailAddress)
        }
        //.disabled(signUpViewModel.disableFirstPageNextButton)
        //.onReceive(signInViewModel.showSignInbutton) {
        //self.disableLoginButton = $0 ?? true
        //}
    }
}

struct SignUpButton_Previews: PreviewProvider {
    static var previews: some View {
        SignUpButton(signUpViewModel: .init(), goToNextPage: {})
    }
}
