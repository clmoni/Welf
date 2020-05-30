//
//  PasswordEntryView.swift
//  Welf
//
//  Created by Clement Oniovosa on 26/05/2020.
//  Copyright © 2020 Clement Oniovosa. All rights reserved.
//

import SwiftUI

struct PasswordEntryView: View {
    @Binding var password: String
    @Binding var showPassword: Bool
    
    var body: some View {
        GenericSecureField(label: "Password", showPassword: $showPassword, secureText: $password, inputVisibilityIconPadding: 20)
    }
}

struct PasswordEntryView_Previews: PreviewProvider {   
    static var previews: some View {
        PasswordEntryView(password: .constant("test"), showPassword: .constant(false))
    }
}
