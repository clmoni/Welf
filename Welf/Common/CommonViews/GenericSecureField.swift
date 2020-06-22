//
//  GenericSecureField.swift
//  Welf
//
//  Created by Clem on 30/05/2020.
//  Copyright © 2020 Clem. All rights reserved.
//

import SwiftUI

struct GenericSecureField: View {
    var label: String
    @Binding var showPassword: Bool
    @Binding var secureText: String
    var inputVisibilityIconPadding: CGFloat = 0
    
    var body: some View {
        VStack {
            self.toggleFieldBetweenTextAndSecureForVisibility()
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
            
            Divider()
                .frame(height: 1)
                .background(Color.green)
        }
    }
    
    private func toggleFieldBetweenTextAndSecureForVisibility() -> some View {
        VStack {
            HStack {
                if self.showPassword {
                    TextField(self.label, text: $secureText)
                        .autocapitalization(.none)
                } else {
                    SecureField(self.label, text: $secureText)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 1, trailing: 0))
                }
                
                self.createVisibilityToggleButton()
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: inputVisibilityIconPadding))
            }
        }
    }
    
    private func createVisibilityToggleButton() -> some View {
        Button(action: { self.toggleShowPassword() }) {
            Image(systemName: self.showPassword ? "eye.fill" : "eye.slash.fill")
                .foregroundColor(self.showPassword ? .green : .secondary)
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
        GenericSecureField(label: "test", showPassword: .constant(true), secureText: .constant(""))
    }
}
