//
//  InitialLanding.swift
//  Welf
//
//  Created by Clem on 06/03/2020.
//  Copyright © 2020 Clem. All rights reserved.
//

import SwiftUI

struct UnauthorisedLandingView: View {
    @EnvironmentObject private var authService: AuthenticationService
    @State private var showRegistrationModal: Bool = false
    
    var body: some View {
        NavigationView {
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
    }
    
    private func createLogoView() -> some View {
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
                    .injectSystemServices()
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
        Group {
            UnauthorisedLandingView()
                .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
                .previewDisplayName("iPhone SE")
            
            UnauthorisedLandingView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
                .previewDisplayName("iPhone 8")
            
            UnauthorisedLandingView()
                .previewDevice(PreviewDevice(rawValue: "iPhone Xs Max"))
                .previewDisplayName("iPhone Xs Max")
        }
        .injectSystemServices()
    }
}
