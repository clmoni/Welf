//
//  AuthenticationCallToActionView.swift
//  Welf
//
//  Created by Clement Oniovosa on 27/05/2020.
//  Copyright © 2020 Clement Oniovosa. All rights reserved.
//

import SwiftUI

struct AuthenticationCallToActionView: View {
    var username: String
    var password: String
    var signIn: () -> ()
    
    var body: some View {
        
        let forgotPasswordText: GenericText =
            GenericText(font: .subheadline, text: "Forgot password?", colour: .green)
        let logInText = Text("Log in")
            .foregroundColor(Color.white)
            .bold()
        
        return VStack{
            Divider()
                .frame(height: 0.5)
                .background(Color.green)
            
            HStack{
                GenericTextButton(text: forgotPasswordText, destination: ForgotPasswordView())
                Spacer()
                GenericButton(buttonDisplayView: logInText) { () in
                    self.signIn()
                }
                .alert(isPresented: .constant(true)) {
                    Alert(title: Text("Important message"), message: Text("Wear sunscreen"), dismissButton: .default(Text("Got it!")))
                }
            }
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 8, trailing: 20))
            
        }
    }
    
}

struct AuthenticationCallToActionView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationCallToActionView(username: "", password: "", signIn: {})
    }
}
