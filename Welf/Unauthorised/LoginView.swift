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
    @State private var keyboardHeight: CGFloat = 0
    private let app = UIApplication.shared.delegate as! AppDelegate
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    GenericAvatar()
                        .scaleEffect(0.7)
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 100, trailing: 0))
                .frame(maxHeight: 350)
                
                Text(verbatim: "Login")
                    .bold()
                    .font(.title)
                
                Text(verbatim: "Keep track of your finances")
                    .font(.subheadline)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 40, trailing: 0))
                
                VStack {
                    TextField("Username", text: $username)
                        .autocapitalization(.none) //avoid autocapitalization of the first letter
                        .padding()
                        .cornerRadius(4.0)
                        .background(Color(UIColor.systemFill))
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 15, trailing: 0))
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .cornerRadius(4.0)
                        .background(Color(UIColor.systemFill))
                        .padding(.bottom, 10)
                }.KeyboardAwarePadding()
                
                GenericButton(text: "Continue", radius: 4.0) { () in
                    self.app.signIn(username: self.username, password: self.password)
                }
            }
            .padding()
            .frame(maxHeight: .infinity)
//            .navigationBarTitle("Login")
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
