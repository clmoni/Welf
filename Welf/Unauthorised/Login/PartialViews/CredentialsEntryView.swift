//
//  CredentialsEntryView.swift
//  Welf
//
//  Created by Clement Oniovosa on 26/05/2020.
//  Copyright © 2020 Clement Oniovosa. All rights reserved.
//

import SwiftUI

struct CredentialsEntryView: View {
    @Binding var username: String
    @Binding var password: String
    @Binding var showPassword: Bool
    
    var body: some View {
        VStack{
            Group {
                UsernameEntryView(username: $username)
                PasswordEntryView(password: $password, showPassword: $showPassword)
            }
        }
        .offset(y: -230)
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 5, trailing: 0))
    }
}

struct CredentialsEntryView_Previews: PreviewProvider {
    static var previews: some View {
        CredentialsEntryView(username: .constant("test_user"), password: .constant("test"), showPassword: .constant(false))
    }
}
