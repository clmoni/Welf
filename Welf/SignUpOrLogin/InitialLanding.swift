//
//  InitialLanding.swift
//  Welf
//
//  Created by Clement Oniovosa on 06/03/2020.
//  Copyright © 2020 Clement Oniovosa. All rights reserved.
//

import SwiftUI

struct SignUpOrLogin: View {
    var body: some View {
        VStack() {
            VStack {
                Logo()
                Description()
            }
            .position(x: 192, y: 350)
           
            createSignUpButton()
            Login()
        }
        .padding(.horizontal)
    }
    
    func createSignUpButton() -> GenericButton {
        let signUpButtonText: String = "sign up"
        let signUpTextView = GenericText(
            signUpButtonText,
            font: .headline,
            weight: .bold,
            colour: .white)
        
        return GenericButton(text: signUpTextView, action: {})
    }
}

struct SignUpOrLogin_Previews: PreviewProvider {
    static var previews: some View {
        SignUpOrLogin()
    }
}
