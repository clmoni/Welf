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
    @Binding var authenticationState: UserAuthenticationState
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                self.createLogoView()
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 100, trailing: 0))
                    .frame(maxHeight: 350)
                
                self.createDescriptionView(geometry)
                Spacer()
                
                VStack {
                    self.createSignUpButton()
                    self.createLoginCallToAction()
                }
            }
            .padding()
            .navigationBarTitle("")
        }
    }
    
    private func createLogoView() -> some View {
        //return Logo(width: 250.0, height: 250.0, contentMode: .fit)
        //.padding(.bottom, 30)
        VStack {
            WelfLogo()
                .scaleEffect(0.7)
        }
    }
    
    private func createDescriptionView(_ geometry: GeometryProxy) -> some View {
        return Description()
            .frame(maxHeight: 180, alignment: .center)
            .offset(y: -(geometry.size.height/12))
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
        Login(authenticationState: $authenticationState)
            .padding()
            .frame(alignment: .center)        
    }
}

struct UnauthorisedLandingView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            UnauthorisedLandingView(authenticationState: .constant(UserAuthenticationState()))
                .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
                .previewDisplayName("iPhone SE")
            
            UnauthorisedLandingView(authenticationState: .constant(UserAuthenticationState()))
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
                .previewDisplayName("iPhone 8")
            
            UnauthorisedLandingView(authenticationState: .constant(UserAuthenticationState()))
                .previewDevice(PreviewDevice(rawValue: "iPhone Xs Max"))
                .previewDisplayName("iPhone Xs Max")
        }
    }
}
