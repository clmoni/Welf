//
//  AuthenticationCallToActionView.swift
//  Welf
//
//  Created by Clement Oniovosa on 27/05/2020.
//  Copyright © 2020 Clement Oniovosa. All rights reserved.
//

import SwiftUI

struct AuthenticationCallToActionView: View {
    private let app: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    @State private var disableLoginButton: Bool = true
    @EnvironmentObject private var user: User
    
    @ObservedObject var signInViewModel: SignInViewModel
    
    var body: some View {
        
        let forgotPasswordText: GenericText =
            GenericText(font: .subheadline, text: "Forgot password?", colour: .green)
        
        let logInText = Text("Log in")
            .foregroundColor(Color.white)
            .bold()
        
        return VStack {
            NavigationLink(destination: ForgotPasswordView(), isActive: self.$signInViewModel.showForgotPasswordView) {
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
                    backgroundColour: disableLoginButton ? .secondary : .green
                ) { () in
                    self.signIn()
                }
                .alert(isPresented: $user.authenticationState.isBadCredentialsSignInError) {
                    KeyboardResponder.dismissKeyboard()
                    return self.signInErrorAlert()
                }
                .disabled(disableLoginButton)
                .onReceive(signInViewModel.showSignInbutton) {
                    self.disableLoginButton = $0 ?? true
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
            self.signInViewModel.showForgotPasswordView = true
        }
        
        return Alert(title: titleText, message: messageText, primaryButton: .default(okBtnText), secondaryButton: resetBtn)
    }
    
    private func signIn() {
        self.app.authService.signIn(username: self.signInViewModel.username, password: self.signInViewModel.password)
    }
}

struct AuthenticationCallToActionView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationCallToActionView(signInViewModel: SignInViewModel())
            .environmentObject(User())
    }
}
