//
//  SignUp.swift
//  Welf
//
//  Created by Clement Oniovosa on 07/03/2020.
//  Copyright © 2020 Clement Oniovosa. All rights reserved.
//

import SwiftUI

struct SignUp: View {
    init(){
        UITableView.appearance().backgroundColor = .clear
    }
    
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                
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
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
        //.environment(\.colorScheme, .dark)
    }
}
