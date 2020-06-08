//
//  SignUp.swift
//  Welf
//
//  Created by Clement Oniovosa on 07/03/2020.
//  Copyright © 2020 Clement Oniovosa. All rights reserved.
//

import SwiftUI

struct SignUpView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var emailAddress: String = ""
    @State private var phoneNumber: String = ""
    @State private var showPassword: Bool = false
    private var registrationService = RegistrationService()
    
    
    var body: some View {
        VStack {
            CreateAccountDismissalBarView(dismiss: self.dismissRegistrationModalView)
                .offset(y: -265)
            
            VStack {
                Group {
                    GenericTextField(label: "User name", text: $username)
                    
                    GenericSecureField(label: "Password", showPassword: $showPassword, secureText: $password)
                    
                    GenericTextField(label: "Email address", text: $emailAddress)
                    
                    GenericTextField(label: "Phone number", text: $phoneNumber)
                }
            }
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
            .offset(y: -265)
            
            GenericResizeableButton(text: "Next", radius: 8, height: 25, action: self.signUp)
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                .offset(y: 250)
                .keyboardAwarePadding(placeButtonOnTopOfKeyboard: true)
            
        }
        .frame(maxHeight: .infinity)
        .navigationBarTitle("Sign Up")
    }
    
    private func signUp() {
        self.registrationService.signUp(username: username, password: password, email: emailAddress, phoneNumber: phoneNumber)
    }
    
    private func dismissRegistrationModalView() {
        print("dismisses form")
        self.presentationMode.wrappedValue.dismiss()
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
        .environment(\.colorScheme, .dark)
    }
}

