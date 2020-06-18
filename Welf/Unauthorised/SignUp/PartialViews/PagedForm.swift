//
//  PagedForm.swift
//  Welf
//
//  Created by Clement Oniovosa on 18/06/2020.
//  Copyright © 2020 Clement Oniovosa. All rights reserved.
//

import SwiftUI

struct PagedForm: View {
    @ObservedObject var signUpViewModel: SignUpViewModel
    
    var body: some View {
        ZStack {
            if self.signUpViewModel.currentPage == 1 {
                VStack{
                    GenericTextField(label: "First name", text: self.$signUpViewModel.firstName, autocapitalization: .sentences)
                    GenericTextField(label: "Last name", text: self.$signUpViewModel.lastName, autocapitalization: .sentences)
                }
                .transition(.move(edge: .leading))
            } else if self.signUpViewModel.currentPage == 2 {
                VStack {
                    GenericTextField(label: "User name", text: self.$signUpViewModel.username)
                    GenericSecureField(label: "Password", showPassword: self.$signUpViewModel.showPassword, secureText: self.$signUpViewModel.password)
                }
                .transition(.move(edge: .leading))
            } else {
                VStack {
                    GenericTextField(label: "Email address", text: self.$signUpViewModel.emailAddress)
                    GenericTextField(label: "Phone number", text: self.$signUpViewModel.phoneNumber)
                }
                .transition(.move(edge: .leading))
            }
        }
    }
}

struct PagedForm_Previews: PreviewProvider {
    static var previews: some View {
        PagedForm(signUpViewModel: .init())
    }
}
