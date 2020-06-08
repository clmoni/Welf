//
//  SignOutButton.swift
//  Welf
//
//  Created by Clement Oniovosa on 17/05/2020.
//  Copyright © 2020 Clement Oniovosa. All rights reserved.
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
