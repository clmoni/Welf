//
//  AuthenticationCallToActionView.swift
//  Welf
//
//  Created by Clem on 27/05/2020.
//  Copyright © 2020 Clem. All rights reserved.
//

import SwiftUI

struct AuthenticationCallToActionView: View {
    @EnvironmentObject private var authService: AuthenticationService
    
    var body: some View {
        
        let forgotPasswordText: GenericText =
            GenericText(font: .subheadline, text: "Forgot password?", colour: .green)
        
        let logInText = Text("Log in")
            .foregroundColor(Color.white)
            .bold()
        
        return VStack {
            NavigationLink(destination: ForgotPasswordView(), isActive: self.$authService.showForgotPasswordView) {
                EmptyView()
            }
            
            Divider()
                .frame(height: 0.5)
                .background(Color.green)
            
            HStack{
                GenericTextButton(text: forgotPasswordText, destination: ForgotPasswordView())
                
                Spacer()
                
                GenericButton(
                    buttonDisplayView: logInText,
                    backgroundColour: authService.disableLoginButton ? .secondary : .green
                ) { () in
                    self.signIn()
                }
                .alert(isPresented: $authService.isBadCredentialsSignInError) {
                    KeyboardResponder.dismissKeyboard()
                    return self.signInErrorAlert()
                }
                .disabled(authService.disableLoginButton)
                .onReceive(self.authService.showSignInbuttonPublisher) {
                    self.authService.disableLoginButton = $0
                }
                .sheet(isPresented: self.$authService.isUserAccountUnconfirmed) {
                    LoginAccountConfirmation().injectSystemServices()
                }

            }
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 8, trailing: 20))
        }
    }
    
    private func signInErrorAlert () -> Alert {
        let titleText = Text(verbatim: "Please try again")
        let messageText =  Text(verbatim: "The username and password you entered did not match our records. Please try again.")
        let okBtnText = Text(verbatim: "OK")
        let resetBtn: Alert.Button = .default(Text(verbatim: "Reset password")) {
            self.authService.showForgotPasswordView = true
        }
        
        return Alert(title: titleText, message: messageText, primaryButton: .default(okBtnText), secondaryButton: resetBtn)
    }
    
    private func signIn() {
        print("here clicked")
        self.authService.signIn(username: self.authService.username, password: self.authService.password)
    }
}

struct AuthenticationCallToActionView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationCallToActionView()
            .environmentObject(AuthenticationService())
    }
}
