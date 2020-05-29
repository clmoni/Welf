//
//  SignUp.swift
//  Welf
//
//  Created by Clement Oniovosa on 07/03/2020.
//  Copyright © 2020 Clement Oniovosa. All rights reserved.
//

import SwiftUI

struct SignUpView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var username: String = ""
    @State private var password: String = ""
    
//    init(){
//        UITableView.appearance().backgroundColor = .clear
//    }
    
    var body: some View {
        VStack {
            CreateAccountDismissalBarView(dismiss: self.dismissRegistrationModalView)
            
            TextField("User name", text: $username)
                .autocapitalization(.none)
                .padding(.top, 20)
            Divider()
                .frame(height: 1)
                .background(Color.green)
            
            SecureField("Password", text: $password)
                .padding(.top, 10)
            Divider()
                .frame(height: 1)
                .background(Color.green)
            
            TextField("Email address", text: $username)
                .autocapitalization(.none)
                .padding(.top, 20)
            Divider()
                .frame(height: 1)
                .background(Color.green)
            
            TextField("Phone number", text: $username)
                .autocapitalization(.none)
                .padding(.top, 20)
            Divider()
                .frame(height: 1)
                .background(Color.green)
            
        }
        .frame(maxHeight: .infinity)
        .navigationBarTitle("Sign Up")
        .padding()
    }
    
    private func dismissRegistrationModalView() {
        print("dismisses form")
        self.presentationMode.wrappedValue.dismiss()
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
        //.environment(\.colorScheme, .dark)
    }
}

