//
//  LandingView.swift
//  Welf
//
//  Created by Clem on 13/05/2020.
//  Copyright © 2020 Clem. All rights reserved.
//

import SwiftUI

struct LandingView: View {
    @EnvironmentObject private var authService: AuthenticationService
    
    var body: some View {
        
        VStack {
            if !self.$authService.isSignedIn.wrappedValue {
                LoadingView(isShowing: self.$authService.isSigningIn) {
                    UnauthorisedLandingView()
                        .lockViewInPortraitMode()
                }
            } else {
                AuthorisedLandingView()
            }
        }
    }
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView()
            .injectSystemServices()
    }
}
