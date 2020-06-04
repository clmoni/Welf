//
//  AuthenticationCallToActionView.swift
//  Welf
//
//  Created by Clement Oniovosa on 27/05/2020.
//  Copyright © 2020 Clement Oniovosa. All rights reserved.
//

import SwiftUI

struct AuthenticationCallToActionView: View {
    @State private var showForgotPasswordView: Bool = false
    var username: String
    var password: String
    @Binding var authenticationState: UserAuthenticationState
    var signIn: () -> ()
    
    var body: some View {
        
        let forgotPasswordText: GenericText =
            GenericText(font: .subheadline, text: "Forgot password?", colour: .green)
        let logInText = Text("Log in")
            .foregroundColor(Color.white)
            .bold()
        
        return VStack{
            NavigationLink(destination: ForgotPasswordView(), isActive: self.$showForgotPasswordView) {
                EmptyView()
            }
            
            Divider()
                .frame(height: 0.5)
                .background(Color.green)
            
            HStack{
                GenericTextButton(text: forgotPasswordText, destination: ForgotPasswordView())
                Spacer()
                GenericButton(buttonDisplayView: logInText) { () in
                    self.signIn()
                }
                .alert(isPresented: self.$authenticationState.isBadCredentialsSignInError) {
                    let titleText = Text(verbatim: "Please try again")
                    let messageText =  Text(verbatim: "The username and password you entered did not match our records. Please try again.")
                    let okBtnText = Text(verbatim: "OK")
                    let resetBtn: Alert.Button = .default(Text(verbatim: "Reset password")) {
                        self.showForgotPasswordView = true
                    }
                    
                    UIApplication.shared.dismissKeyboard()
                    
                    return Alert(title: titleText, message: messageText, primaryButton: .default(okBtnText), secondaryButton: resetBtn)
                }
            }
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 8, trailing: 20))
        }
    }
}

struct AuthenticationCallToActionView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationCallToActionView(username: "", password: "", authenticationState: .constant(UserAuthenticationState()), signIn: {})
    }
}
