//
//  SignUpOrRegister.swift
//  Welf
//
//  Created by Clement Oniovosa on 06/03/2020.
//  Copyright © 2020 Clement Oniovosa. All rights reserved.
//

import SwiftUI

struct Login: View {
    var body: some View {
        HStack {
            creatLoginTextLabel()
            createLoginTextButton()
        }
    }
    
    func createLoginTextButton() -> some View {
        let logInText: String = "Log in"
        let logInTextView = GenericText(
            logInText,
            font: .subheadline,
            weight: .bold,
            colour: .green)

        return GenericTextButton(text: logInTextView, destination: LoginView()).offset(x: -3)
    }
    
    func creatLoginTextLabel() -> some View {
        let alreadyRegisteredText: String = "Already registered?"
        
        return GenericText(
            alreadyRegisteredText,
            font: .subheadline,
            weight: .light)
            .offset(x:3)
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
