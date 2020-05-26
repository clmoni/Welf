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
                VStack {
                    GenericAvatar()
                        .scaleEffect(0.1)
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                .frame(maxHeight: 1)
                .offset(y: -230)
                
                VStack {
                    Text(verbatim: "Login")
                        .bold()
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .offset(y: -210)
                .padding(20)
                
                VStack {
                    VStack{
                        Group {
                            TextField("User name", text: $username)
                                .autocapitalization(.none)
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                            Divider()
                                .frame(height: 0.8)
                                .background(Color.green)
                            
                            
                            ZStack {
                                HStack {
                                    if self.isHidden {
                                        TextField("Password", text: $password)
                                            .autocapitalization(.none)
                                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                                        
                                    } else {
                                        SecureField("Password", text: $password)
                                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                                    }
                                    
                                    Button(action: { self.isHidden.toggle() }) {
                                        Image(systemName: self.isHidden ? "eye.fill" : "eye.slash.fill")
                                            .foregroundColor(self.isHidden ? Color.green : Color.secondary)
                                    }.offset(x: -20)
                                }
                            }
                            Divider()
                                .frame(height: 0.8)
                                .background(Color.green)
                                .padding(.bottom, 50)
                        }
                    }
                    .offset(y: -230)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 5, trailing: 0))
                }
                createAuthenticationCallToActionStack()
            }
        }
    }
    
    func createAuthenticationCallToActionStack() -> some View {
        let forgotPasswordText =
            GenericText(font: .subheadline, text: "Forgot password?", colour: .green)
        return VStack{
            Divider()
                .frame(height: 0.5)
                .background(Color.green)
            
            HStack{
                GenericTextButton(text: forgotPasswordText, destination: ForgotPasswordView())
                Spacer()
                GenericButton(text: "Log in") { () in
                    self.app.signIn(username: self.username, password: self.password)
                }
            }
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 5, trailing: 20))
            
        }
        .offset(y: 170)
        .KeyboardAwarePadding(placeButtonOnTopOfKeyboard: true)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LoginView()
        }
    }
}
