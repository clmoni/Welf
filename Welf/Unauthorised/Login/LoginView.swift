//
//  LoginView.swift
//  Welf
//
//  Created by Clement Oniovosa on 17/05/2020.
//  Copyright © 2020 Clement Oniovosa. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var username: String = ""
    @State private var password: String = ""

    @State private var showPassword: Bool = false
    
    private let screenHeight: CGFloat = UIScreen.main.bounds.size.height
    
    private let app: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var body: some View {
        //print(screenBoundsRectangle)
        //print(UIScreen.main.bounds.size)
        return GeometryReader { geometry in
            VStack (alignment: .center, spacing: 20) {
                
                CredentialsEntryView(username: self.$username, password: self.$password, showPassword: self.$showPassword)
                .offset(y: -(geometry.size.height/3.6))
                AuthenticationCallToActionView(username: self.username, password: self.password, signIn: self.signIn)
                    .offset(y: geometry.size.height/3.4)
                    .keyboardAwarePadding(placeButtonOnTopOfKeyboard: true)
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: self.createCancleButton(), trailing: self.createLogo(geometry))
        }
        .dismissKeyboardOnTap()
        
        
        //        return VStack {
        //            LoginHeaderView()
        //                .offset(y: -(screenHeight/3.6))
        //
        //            CredentialsEntryView(username: $username, password: $password, showPassword: $showPassword)
        //                .offset(y: -(screenHeight/3.6))
        //
        //            AuthenticationCallToActionView(username: self.username, password: self.password, signIn: self.signIn)
        //                .offset(y: screenHeight/4.9)
        //                .keyboardAwarePadding(placeButtonOnTopOfKeyboard: true)
        //        }
        //            //.frame(width: UIScreen.main.bounds.width-20, alignment: .center)
        //            .dismissKeyboardOnTap()
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
    
    private func calculateHeight(_ geometry: GeometryProxy) -> CGFloat {
        print("TOP: \(geometry.size.height/3.9)")
        print("BOTTOM: \(geometry.size.height/3.9 + geometry.safeAreaInsets.bottom)")
        return geometry.size.height/3.9
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
                    .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
                    .previewDisplayName("iPhone SE")
            }
            
            NavigationView {
                LoginView()
                    .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
                    .previewDisplayName("iPhone 8")
            }
            
            NavigationView {
                LoginView()
                    .previewDevice(PreviewDevice(rawValue: "iPhone Xs Max"))
                    .previewDisplayName("iPhone Xs Max")
            }
        }
    }
}

