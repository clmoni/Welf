//
//  LoginView.swift
//  Welf
//
//  Created by Clement Oniovosa on 17/05/2020.
//  Copyright © 2020 Clement Oniovosa. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var showPassword = false
    @State private var isDragging = false
    
    private let app = UIApplication.shared.delegate as! AppDelegate
    
    var body: some View {
        NavigationView {
            VStack {
                LoginHeaderView()
                    .offset(y: -210)
                
                CredentialsEntryView(username: $username, password: $password, showPassword: $showPassword)
                    .offset(y: -230)
                
                AuthenticationCallToActionView(username: self.username, password: self.password, signIn: self.signIn)
                    .offset(y: 187)
                    .keyboardAwarePadding(placeButtonOnTopOfKeyboard: true)
            }
        }
        .dismissKeyboardOnTap()
    }
    
    var drag: some Gesture {
        DragGesture()
            .onChanged { _ in self.isDragging = true }
            .onEnded { _ in self.isDragging = false }
    }
    
    private func signIn() {
        self.app.signIn(username: self.username, password: self.password)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LoginView()
        }
    }
}

