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
                    VStack{
                        TextField("Username", text: $username)
                            .autocapitalization(.none)
                            .padding()
                            .cornerRadius(4.0)
                            .background(Color(UIColor.systemFill))
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                    
                        SecureField("Password", text: $password)
                            .padding()
                            .cornerRadius(4.0)
                            .background(Color(UIColor.systemFill))
                            .padding(.bottom, 50)
                        
                    }
                    .offset(y: 45)
                    .padding(20)
                    
                    createAuthenticationCallToActionStack()
                }
                .KeyboardAwarePadding()
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
                .offset(y: 50)
            
            HStack{
                GenericTextButton(text: forgotPasswordText, destination: ForgotPasswordView())
                Spacer()
                GenericButton(text: "Log in") { () in
                    self.app.signIn(username: self.username, password: self.password)
                }
            }
            .offset(y: 30)
            .padding(20)
            
        }
        .KeyboardAwarePadding(placeButtonOnTopOfKeyboard: true)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
