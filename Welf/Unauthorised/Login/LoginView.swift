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
    @State private var isHidden = false
    
    private let app = UIApplication.shared.delegate as! AppDelegate
    
    var body: some View {
        NavigationView {
            VStack {
                LoginHeaderView()
                CredentialsEntryView(username: $username, password: $password, isHidden: $isHidden)
                AuthenticationCallToActionView(username: self.username, password: self.password, signIn: self.signIn)
            }
        }
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

