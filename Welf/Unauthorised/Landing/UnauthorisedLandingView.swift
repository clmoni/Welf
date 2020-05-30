//
//  InitialLanding.swift
//  Welf
//
//  Created by Clement Oniovosa on 06/03/2020.
//  Copyright © 2020 Clement Oniovosa. All rights reserved.
//

import SwiftUI

struct UnauthorisedLandingView: View {
    @State private var showRegistrationModal: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            createLogoView()
                
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 100, trailing: 0))
                .frame(maxHeight: 350)
            createDescriptionView()
            
            Spacer()
            
            VStack {
                createSignUpButton()
                createLoginCallToAction()
            }
        }
        .padding(.horizontal)
    }
    
    private func createLogoView() -> some View {
        //return Logo(width: 250.0, height: 250.0, contentMode: .fit)
        //.padding(.bottom, 30)
        VStack {
            WelfLogo()
                .scaleEffect(0.7)
        }
    }
    
    private func createDescriptionView() -> some View {
        Description()
            .frame(maxHeight: 180, alignment: .center)
            .offset(y: -50)
    }
    
    private func createSignUpButton() -> some View {
        GenericResizeableButton(text: "Create account", radius: 8, height: 25) { () in
            print("registration button Pushed")
            self.showRegistrationModal = true
        }
        .sheet(isPresented: self.$showRegistrationModal) {
            SignUpView()
        }
    }
    
    private func createLoginCallToAction() -> some View {
        Login()
            .padding()
            .frame(alignment: .center)
    }
}

struct UnauthorisedLandingView_Previews: PreviewProvider {
    static var previews: some View {
        UnauthorisedLandingView()
    }
}