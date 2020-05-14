//
//  LandingView.swift
//  Welf
//
//  Created by Clement Oniovosa on 13/05/2020.
//  Copyright © 2020 Clement Oniovosa. All rights reserved.
//

import SwiftUI

struct LandingView: View {
    @ObservedObject public var user : UserData
    
    var body: some View {
        let loginView = LoginViewController()
        
        return VStack {
            // .wrappedValue is used to extract the Bool from Binding<Bool> type
            if(!$user.isSignedIn.wrappedValue) {
                ZStack {
                    loginView
                    Button(action: { loginView.authenticate() } ) {
                        UnauthorisedView().scaleEffect(0.5)
                    }
                }
            } else {
                AuthorisedView().environmentObject(user)
            }
        }
    }
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        let app = UIApplication.shared.delegate as! AppDelegate
        return LandingView(user: app.userData)
    }
}
