//
//  SignOutButton.swift
//  Welf
//
//  Created by Clement Oniovosa on 13/05/2020.
//  Copyright © 2020 Clement Oniovosa. All rights reserved.
//

import SwiftUI

struct SignOutButton: View {
    let app = UIApplication.shared.delegate as! AppDelegate
    
    var body: some View {
        NavigationLink(destination: LandingView(user: app.userData)) {
            Button(action: { self.app.signOut() }) {
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
