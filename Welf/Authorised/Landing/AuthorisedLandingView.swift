//
//  AuthorisedLandingView.swift
//  Welf
//
//  Created by Clem on 18/05/2020.
//  Copyright © 2020 Clem. All rights reserved.
//

import SwiftUI

struct AuthorisedLandingView: View {
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Hello, World!")
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarTitle(Text("Welf"))
            .navigationBarItems(trailing: SignOutButton())
        }
    }
}

struct AuthorisedLandingView_Previews: PreviewProvider {
    static var previews: some View {
        AuthorisedLandingView()
    }
}
