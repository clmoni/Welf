//
//  LoginView.swift
//  Welf
//
//  Created by Clement Oniovosa on 17/05/2020.
//  Copyright © 2020 Clement Oniovosa. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var showPassword: Bool = false
    
    private let app: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
        init() {
            UINavigationBar.appearance().backgroundColor = .blue
        }
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack (alignment: .center) {
                    ScrollView(.vertical, showsIndicators: false) {
                        GenericText(font: .system(size: 25), text: "Login", weight: .bold, colour: .primary)
                            .offset(y: -(geometry.size.height/35))
                        CredentialsEntryView(username: self.$username, password: self.$password, showPassword: self.$showPassword)
                            .offset(y: -(geometry.size.height/35))
                    }
                    
                    AuthenticationCallToActionView(username: self.username, password: self.password, signIn: self.signIn)
                        .keyboardAwarePadding(placeButtonOnTopOfKeyboard: true)
                }
                .navigationBarItems(leading: self.createCancleButton(), trailing: self.createLogo(geometry))
            }
            .dismissKeyboardOnTap()
        }
    .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
    
    private func createLogo (_ geometry: GeometryProxy) -> some View {
        WelfLogo()
            .scaleEffect(3.3)
            .frame(maxWidth: 40, maxHeight: 40)
            .offset(x: -(geometry.size.width/2.3))
    }
    
    private func createCancleButton() -> GenericButton<LoginButtonCancelText> {
        GenericButton(
            isGenericButtonStyle: false,
            buttonDisplayView: LoginButtonCancelText(),
            action: {
                self.presentationMode.wrappedValue.dismiss()
        })
    }
    
    private func signIn() {
        self.app.signIn(username: self.username, password: self.password)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LoginView()
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

