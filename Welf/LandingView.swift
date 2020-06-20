//
//  LandingView.swift
//  Welf
//
//  Created by Clem on 13/05/2020.
//  Copyright © 2020 Clem. All rights reserved.
//

import SwiftUI

struct LandingView: View {
    @ObservedObject public var user : User
    
    var body: some View {
        VStack {
            if !self.$user.authenticationState.isSignedIn.wrappedValue {
                UnauthorisedLandingView(user: self.user)
            } else {
                AuthorisedLandingView()
            }
        }
    }
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        return LandingView(user: User())
    }
}
