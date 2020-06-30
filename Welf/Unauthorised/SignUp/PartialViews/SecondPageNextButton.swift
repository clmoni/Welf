//
//  SecondPageNextButton.swift
//  Welf
//
//  Created by Clem on 18/06/2020.
//  Copyright © 2020 Clem. All rights reserved.
//

import SwiftUI

struct SecondPageNextButton: View {
    @EnvironmentObject private var signUpService: SignUpService
    var goToNextPage: () -> ()
    
    var body: some View {
        let logInText = Text("Next")
            .foregroundColor(Color.white)
            .bold()
        
        return GenericButton(
            buttonDisplayView: logInText,
            backgroundColour: signUpService.disableSecondPageNextButton ? .secondary : .green
        ) { () in
            self.goToNextPage()
        }
        //.disabled(signUpViewModel.disableFirstPageNextButton)
        //.onReceive(signInViewModel.showSignInbutton) {
        //self.disableLoginButton = $0 ?? true
        //}
    }
}

struct SecondPageNextButton_Previews: PreviewProvider {
    static var previews: some View {
        SecondPageNextButton(goToNextPage: {}).environmentObject(SignUpService())
    }
}
