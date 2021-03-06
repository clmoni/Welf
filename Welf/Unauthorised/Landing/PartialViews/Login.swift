//
//  SignUpOrRegister.swift
//  Welf
//
//  Created by Clem on 06/03/2020.
//  Copyright © 2020 Clem. All rights reserved.
//

import SwiftUI

struct Login: View {
    @EnvironmentObject private var authService: AuthenticationService
    
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
        
        let loginView = LoginView().injectSystemServices()
        
        return GenericTextButton(text: logInTextView, destination: loginView)
            .offset(x: -3)
    }
    
    func creatLoginTextLabel() -> some View {
        let alreadyRegisteredText: String = "Already registered?"
        
        return GenericText(
            font: .subheadline, text: alreadyRegisteredText,
            weight: .light)
            .offset(x: 3)
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
