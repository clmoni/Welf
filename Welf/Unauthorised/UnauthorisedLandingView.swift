//
//  InitialLanding.swift
//  Welf
//
//  Created by Clement Oniovosa on 06/03/2020.
//  Copyright © 2020 Clement Oniovosa. All rights reserved.
//

import SwiftUI

struct UnauthorisedLandingView: View {
    var body: some View {
        VStack {
            Spacer()
            createLogoView()
            createDescriptionView()
            Spacer()
            
            VStack {
                createSignUpButton()
                createLoginCallToAction()
            }
        }
        .padding(.horizontal)
    }
    
    func createLogoView() -> some View {
        return Logo(width: 250.0, height: 250.0, contentMode: .fit)
            .padding(.bottom, 30)
    }
    
    func createDescriptionView() -> some View {
        return Description()
            .frame(maxHeight: 180, alignment: .center)
    }
    
    func createSignUpButton() -> some View {
        let signUpButtonText: String = "sign up"
        let signUpTextView = GenericText(
            font: .headline, text: signUpButtonText,
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

struct UnauthorisedLandingView_Previews: PreviewProvider {
    static var previews: some View {
        UnauthorisedLandingView()
    }
}
