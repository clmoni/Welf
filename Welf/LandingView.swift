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
        return NavigationView {
            // .wrappedValue is used to extract the Bool from Binding<Bool> type
            if(!$user.isSignedIn.wrappedValue) {
                UnauthorisedLandingView()
            } else {
                AuthorisedLandingView().environmentObject(user)
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
