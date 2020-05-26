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
    @Binding var isHidden: Bool
    
    var body: some View {
        VStack {
            ZStack {
                HStack {
                    if self.isHidden {
                        TextField("Password", text: $password)
                            .autocapitalization(.none)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                        
                    } else {
                        SecureField("Password", text: $password)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                    }
                    
                    Button(action: { self.isHidden.toggle() }) {
                        Image(systemName: self.isHidden ? "eye.fill" : "eye.slash.fill")
                            .foregroundColor(self.isHidden ? Color.green : Color.secondary)
                    }.offset(x: -20)
                }
            }
            
            Divider()
                .frame(height: 0.8)
                .background(Color.green)
                .padding(.bottom, 50)
        }
    }
}

struct PasswordEntryView_Previews: PreviewProvider {   
    static var previews: some View {
        PasswordEntryView(password: .constant("test"), isHidden: .constant(false))
    }
}
