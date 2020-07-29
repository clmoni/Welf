//
// LoginAccountConfirmation.swift
// Welf
//
//  Created by Clem on 13/07/2020.
// Copyright © 2020 Clem. All rights reserved.
//

import SwiftUI

struct LoginAccountConfirmation: View {
    @EnvironmentObject private var authService: AuthenticationService
    @EnvironmentObject private var keyboard: KeyboardResponder
    
    var body: some View {
        GeometryReader { geometry in
            LoadingView(isShowing: self.$authService.isSigningIn, activityText: "Signing In") {
                VStack {
                    DismissalBarView(viewTitle: "Verify Account")
                    VStack {
                        VStack {
                            AccountConfirmationStep(
                                confirmationCodeDestination: self.authService.confirmationCodeDestination ?? ""
                            )
                        }
                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                        .animation(.easeInOut(duration: 0.7))
                        
                        Spacer()
                        
                        VStack {
                            Divider()
                                .frame(height: 0.5)
                                .background(Color.green)
                            HStack {
                                Spacer()
                                AccountConfirmationButton(username: self.authService.username)
                            }
                            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                        }
                        .padding(self.calculateButtonPadding(geometry, keyboard: self.keyboard))
                        .offset(y: self.getOffset(geometry, keyboard: self.keyboard))
                    }
                }
            }
        }
    }
}

struct LoginAccountConfirmation_Previews: PreviewProvider {
    static var previews: some View {
        LoginAccountConfirmation().injectSystemServices()
    }
}
