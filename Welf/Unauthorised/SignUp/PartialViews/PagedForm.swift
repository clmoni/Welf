//
//  PagedForm.swift
//  Welf
//
//  Created by Clem on 18/06/2020.
//  Copyright © 2020 Clem. All rights reserved.
//

import SwiftUI
import Foundation

struct PagedForm: View {
    @EnvironmentObject private var signUpService: SignUpService
    @EnvironmentObject private var contactDetailsService: ContactDetailsService
    
    var body: some View {
        ZStack {
            if self.signUpService.currentPage == 1 {
                FirstStep()
            } else if self.signUpService.currentPage == 2 {
                SecondStep()
            } else {
                VStack {
                    GenericTextField(label: "Email address", text: self.$contactDetailsService.emailAddress)
                    GenericTextField(label: "Phone number", text: self.$contactDetailsService.phoneNumber)
                }
                .transition(.move(edge: .leading))
            }
        }
    }
}

struct PagedForm_Previews: PreviewProvider {
    static var previews: some View {
        let signupService = SignUpService()
        signupService.currentPage = 2
        return PagedForm().environmentObject(signupService)
    }
}

