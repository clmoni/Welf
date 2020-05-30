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
            HStack {
                if self.showPassword {
                    TextField(self.label, text: $secureText)
                        .autocapitalization(.none)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 1, trailing: 0))
                    
                } else {
                    SecureField(self.label, text: $secureText)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 1, trailing: 0))
                }
                
                Button(action: { self.toggleShowPassword() }) {
                    Image(systemName: self.showPassword ? "eye.fill" : "eye.slash.fill")
                        .foregroundColor(self.showPassword ? .green : .secondary)
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: trailingPadding))
                
            }
            .padding(.top, 10)
            
            Divider()
                .frame(height: 1)
                .background(Color.green)
        }
    }
    
    private func toggleShowPassword() {
        UIApplication.shared.dismissKeyboard()
        DispatchQueue.main.async {
            print("toggling password visibility")
            self.showPassword.toggle()
        }
    }
}

struct GenericSecureField_Previews: PreviewProvider {
    static var previews: some View {
        GenericSecureField(label: "", showPassword: .constant(true), secureText: .constant(""))
    }
}
