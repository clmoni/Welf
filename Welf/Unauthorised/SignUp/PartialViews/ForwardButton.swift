//
//  ForwardButton.swift
//  Welf
//
//  Created by Clem on 18/06/2020.
//  Copyright © 2020 Clem. All rights reserved.
//

import SwiftUI

struct ForwardButton: View {
    @EnvironmentObject private var signUpService: SignUpService
    @EnvironmentObject private var credentialsService: SignUpUserCredentialsService
    
    var body: some View {
        VStack {
            if signUpService.currentPage == signUpService.firstPage {
                FirstPageNextButton(goToNextPage: self.signUpService.goToNextPage)
            }
            else if signUpService.currentPage == 2 {
                SecondPageNextButton(goToNextPage: self.signUpService.goToNextPage)
            }
            else if signUpService.currentPage == 3 {
                SignUpButton()
            }
            else {
                AccountConfirmationButton(username: self.credentialsService.username)
            }
        }
    }
}

struct ForwardButton_Previews: PreviewProvider {
    static var previews: some View {
        ForwardButton().injectSystemServices()
    }
}
