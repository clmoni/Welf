//
//  SecondPageNextButton.swift
//  Welf
//
//  Created by Clement Oniovosa on 18/06/2020.
//  Copyright © 2020 Clement Oniovosa. All rights reserved.
//

import SwiftUI

struct SecondPageNextButton: View {
    @ObservedObject var signUpViewModel: SignUpViewModel
    var goToNextPage: () -> ()
    
    var body: some View {
        let logInText = Text("Next")
            .foregroundColor(Color.white)
            .bold()
        
        return GenericButton(
            buttonDisplayView: logInText,
            backgroundColour: signUpViewModel.disableSecondPageNextButton ? .secondary : .green
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
        SecondPageNextButton(signUpViewModel: .init(), goToNextPage: {})
    }
}
