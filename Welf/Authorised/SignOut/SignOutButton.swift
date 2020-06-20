//
//  SignOutButton.swift
//  Welf
//
//  Created by Clem on 17/05/2020.
//  Copyright © 2020 Clem. All rights reserved.
//

import SwiftUI

struct SignOutButton: View {
    //let app = UIApplication.shared.delegate as! AppDelegate
    private let _authService = AuthenticationService()
    
    var body: some View {
        NavigationLink(destination: LandingView(user: _authService.user)) {
            Button(action: { self._authService.signOut() }) {
                Text("Sign Out")
            }
        }
    }
}


struct SignOutButton_Previews: PreviewProvider {
    static var previews: some View {
        SignOutButton()
    }
}
