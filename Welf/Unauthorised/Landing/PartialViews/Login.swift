//
//  SignUpOrRegister.swift
//  Welf
//
//  Created by Clement Oniovosa on 06/03/2020.
//  Copyright © 2020 Clement Oniovosa. All rights reserved.
//

import SwiftUI

struct Login: View {
    @Binding var authenticationState: UserAuthenticationState
    
    var body: some View {
        HStack {
            creatLoginTextLabel()
            createLoginTextButton()
        }
    }
    
    func createLoginTextButton() -> some View {
        let logInText: String = "Log in"
        let logInTextView = GenericText(
            font: .subheadline, text: logInText,
            weight: .bold,
            colour: .green)
        
        return GenericTextButton(text: logInTextView, destination: LoginView(authenticationState: $authenticationState))
            .offset(x: -3)
    }
    
    func creatLoginTextLabel() -> some View {
        let alreadyRegisteredText: String = "Already registered?"
        
        return GenericText(
            font: .subheadline, text: alreadyRegisteredText,
            weight: .light)
            .offset(x:3)
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login(authenticationState: .constant(UserAuthenticationState()))
    }
}
