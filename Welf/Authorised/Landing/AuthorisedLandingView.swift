//
//  AuthorisedLandingView.swift
//  Welf
//
//  Created by Clement Oniovosa on 18/05/2020.
//  Copyright © 2020 Clement Oniovosa. All rights reserved.
//

import SwiftUI

struct AuthorisedLandingView: View {
    @EnvironmentObject private var userData: UserData
    var body: some View {
        VStack {
            Text("Hello, World!")
        }
        .navigationBarTitle(Text("Welf"))
        .navigationBarItems(trailing: SignOutButton())
    }
}

struct AuthorisedLandingView_Previews: PreviewProvider {
    static var previews: some View {
        AuthorisedLandingView()
    }
}
