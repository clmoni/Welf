//
//  GenericSecureField.swift
//  Welf
//
//  Created by Clement Oniovosa on 30/05/2020.
//  Copyright © 2020 Clement Oniovosa. All rights reserved.
//

import SwiftUI

struct GenericSecureField: View {
    var label: String
    @Binding var showPassword: Bool
    @Binding var secureText: String
    var trailingPadding: CGFloat = 0
    
    var body: some View {
        VStack {
            ZStack {
                HStack {
                    if self.showPassword {
                        TextField(self.label, text: $secureText)
                            .autocapitalization(.none)
                        
                    } else {
                        SecureField(self.label, text: $secureText)
                    }
                    
                    Button(action: { self.showPassword.toggle() }) {
                        Image(systemName: self.showPassword ? "eye.fill" : "eye.slash.fill")
                            .foregroundColor(self.showPassword ? Color.green : Color.secondary)
                    }.padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: trailingPadding))
                }
            }
            .padding(.top, 10)
            
            Divider()
                .frame(height: 1)
                .background(Color.green)
        }
    }
}

struct GenericSecureField_Previews: PreviewProvider {
    static var previews: some View {
        GenericSecureField(label: "", showPassword: .constant(false), secureText: .constant(""))
    }
}
