//
//  UsernameEntryView.swift
//  Welf
//
//  Created by Clement Oniovosa on 26/05/2020.
//  Copyright © 2020 Clement Oniovosa. All rights reserved.
//

import SwiftUI

struct UsernameEntryView: View {
    @Binding var username: String
    
    var body: some View {
        VStack {
            GenericTextField(label: "User name", text: $username)
        }
    }
}

struct UsernameEntryView_Previews: PreviewProvider {
    static var previews: some View {
        UsernameEntryView(username: .constant("test_user"))
    }
}
