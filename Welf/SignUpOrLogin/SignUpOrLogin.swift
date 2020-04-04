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
        NavigationView {
            ZStack {
                Color.white.edgesIgnoringSafeArea(.all)
                VStack {
                    createLogoView()
                    createDescriptionView()
                    createSignUpButton()
                    createLoginCallToAction()
                }
            }
        }
        .padding(.horizontal)
        .frame(maxHeight: .infinity)
    }
    
    func createLogoView() -> some View {
        return Logo()
            .frame(alignment: .center)
    }
    
    func createDescriptionView() -> some View {
        return Description()
            .frame(maxHeight: .infinity, alignment: .center)
    }
    
    func createSignUpButton() -> some View {
        let signUpButtonText: String = "sign up"
        let signUpTextView = GenericText(
            signUpButtonText,
            font: .headline,
            weight: .bold,
            colour: .white)

        return GenericNavigationButton(text: signUpTextView, destination: SignUp())
            .frame(alignment: .center)
    }
    
    func createLoginCallToAction() -> some View {
        return Login()
            .padding()
            .frame(alignment: .center)
    }
}

struct SignUpOrLogin_Previews: PreviewProvider {
    static var previews: some View {
        SignUpOrLogin()
        .environment(\.colorScheme, .light)
    }
}
