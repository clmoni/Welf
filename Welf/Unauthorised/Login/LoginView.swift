//
//  LoginView.swift
//  Welf
//
//  Created by Clement Oniovosa on 17/05/2020.
//  Copyright © 2020 Clement Oniovosa. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject private var userData: UserData
    @ObservedObject var keyboard = KeyboardResponder()
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var showPassword: Bool = false
    
    private let app: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var body: some View {
        GeometryReader { geometry in
            VStack (alignment: .center) {
                ScrollView(.vertical, showsIndicators: false) {
                    GenericText(font: .system(size: 25), text: "Login", weight: .bold, colour: .primary)
                        .offset(y: -(geometry.size.height/25))
                    CredentialsEntryView(username: self.$username, password: self.$password, showPassword: self.$showPassword)
                        .offset(y: -(geometry.size.height/30))
                }
                
                AuthenticationCallToActionView(username: self.username, password: self.password, signIn: self.signIn)
                    .padding(.bottom, self.calculatePadding(geometry))
            }
            .dismissKeyboardOnDrag()
        }
    }
    
    private func calculatePadding(_ geometry: GeometryProxy) -> CGFloat {
        let defaultPadding = geometry.safeAreaInsets.bottom/2.5
        let keyboardAwarePadding = self.keyboard.currentHeight - geometry.safeAreaInsets.bottom
        
        return self.keyboard.currentHeight == 0 ? defaultPadding : keyboardAwarePadding
    }
    
    private func createLogo(_ geometry: GeometryProxy) -> some View {
        WelfLogo()
            .scaleEffect(0.7)
            .frame(maxWidth: 40, maxHeight: 40)
            .offset(y: -100)
    }
    
    private func signIn() {
        self.app.signIn(username: self.username, password: self.password)
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
    }
}
