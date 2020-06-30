//
//  LoginView.swift
//  Welf
//
//  Created by Clem on 17/05/2020.
//  Copyright © 2020 Clem. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject private var keyboard: KeyboardResponder
    
    var body: some View {
        GeometryReader { geometry in
            VStack (alignment: .center) {
                ScrollView(.vertical, showsIndicators: false) {
                    GenericText(font: .system(size: 25), text: "Login", weight: .bold, colour: .primary)
                        .offset(y: -(geometry.size.height/25))
                    CredentialsEntryView()
                        .offset(y: -(geometry.size.height/30))
                        .animation(.easeInOut(duration: 0.7))
                }
                
                AuthenticationCallToActionView()
                    .padding(.bottom, self.keyboard.calculateMovingPadding(geometry))
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
        .modifier(SystemServices())
    }
}
