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
            TextField("User name", text: $username)
                .autocapitalization(.none)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
            Divider()
                .frame(height: 0.8)
                .background(Color.green)
        }
    }
}

struct UsernameEntryView_Previews: PreviewProvider {
    static var previews: some View {
        UsernameEntryView(username: .constant("test_user"))
    }
}
