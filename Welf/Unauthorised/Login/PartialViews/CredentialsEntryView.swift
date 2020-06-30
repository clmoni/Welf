//
//  CredentialsEntryView.swift
//  Welf
//
//  Created by Clem on 26/05/2020.
//  Copyright © 2020 Clem. All rights reserved.
//

import SwiftUI

struct CredentialsEntryView: View {
    @EnvironmentObject private var authService: AuthenticationService
    
    var body: some View {
        VStack{
            Group {
                UsernameEntryView(username: $authService.username)
                PasswordEntryView(password: $authService.password, showPassword: $authService.showPassword)
            }
        }
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 5, trailing: 0))
        
    }
}

struct CredentialsEntryView_Previews: PreviewProvider {
    static var previews: some View {
        CredentialsEntryView().environmentObject(AuthenticationService())
    }
}
