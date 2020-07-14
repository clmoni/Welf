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
    
    var body: some View {
        ZStack {
            if self.signUpService.currentPage == 1 {
                NameStep()
            } else if self.signUpService.currentPage == 2 {
                CredentialsStep()
            } else if self.signUpService.currentPage == 3 {
                ContactDetailsStep()
            } else {
                AccountConfirmationStep(
                    confirmationCodeDestination: signUpService.confirmationCodeDestination ?? "you"
                )
            }
        }
    }
}

struct PagedForm_Previews: PreviewProvider {
    static var previews: some View {
        PagedForm()
            .injectSystemServices()
    }
}

