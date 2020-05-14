//
//  AuthorisedView.swift
//  Welf
//
//  Created by Clement Oniovosa on 13/05/2020.
//  Copyright © 2020 Clement Oniovosa. All rights reserved.
//

import SwiftUI

struct AuthorisedView: View {
    @EnvironmentObject private var userData: UserData
    var body: some View {
        NavigationView {
            VStack {
                Text("Hello, World!")
            }
            .navigationBarTitle(Text("Welf"))
            .navigationBarItems(trailing: SignOutButton())
        }
    }
}

struct AuthorisedView_Previews: PreviewProvider {
    static var previews: some View {
        AuthorisedView()
    }
}
