//
//  LoginView.swift
//  Welf
//
//  Created by Clement Oniovosa on 17/05/2020.
//  Copyright © 2020 Clement Oniovosa. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject private var keyboard = KeyboardResponder()
    @ObservedObject private var signInViewModel = SignInViewModel()
    @EnvironmentObject private var user: User
    
    var body: some View {
        GeometryReader { geometry in
            VStack (alignment: .center) {
                ScrollView(.vertical, showsIndicators: false) {
                    GenericText(font: .system(size: 25), text: "Login", weight: .bold, colour: .primary)
                        .offset(y: -(geometry.size.height/25))
                    CredentialsEntryView(signInViewModel: self.signInViewModel)
                        .offset(y: -(geometry.size.height/30))
                        .animation(.easeInOut(duration: 0.7))
                }
                
                AuthenticationCallToActionView(signInViewModel: self.signInViewModel)
                    .padding(.bottom, self.keyboard.calculateMovingPadding(geometry))
                    .environmentObject(self.user)
            }
            .dismissKeyboardOnDrag()
        }
    }
    
    private func createLogo(_ geometry: GeometryProxy) -> some View {
        WelfLogo()
            .scaleEffect(0.7)
            .frame(maxWidth: 40, maxHeight: 40)
            .offset(y: -100)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                LoginView()
            }
            .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
            .previewDisplayName("iPhone SE")
            
            NavigationView {
                LoginView()
            }
            .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
            .previewDisplayName("iPhone 8")
            
            NavigationView {
                LoginView()
            }
            .previewDevice(PreviewDevice(rawValue: "iPhone Xs Max"))
            .previewDisplayName("iPhone Xs Max")
        }
        .environmentObject(User())
    }
}
