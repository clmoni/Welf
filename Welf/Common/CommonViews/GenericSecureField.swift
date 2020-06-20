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
    var inputVisibilityIconPadding: CGFloat = 0
    
    var body: some View {
        VStack {
            HStack {
                self.toggleFieldBetweenTextAndSecureForVisibility()
                self.createVisibilityToggleButton()
            }
            
            Divider()
                .frame(height: 1)
                .background(Color.green)
        }
    }
    
    private func createVisibilityToggleButton() -> some View {
        Button(action: { self.toggleShowPassword() }) {
            Image(systemName: self.showPassword ? "eye.fill" : "eye.slash.fill")
                .foregroundColor(self.showPassword ? .green : .secondary)
        }
        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: inputVisibilityIconPadding))
    }
    
    private func toggleFieldBetweenTextAndSecureForVisibility() -> some View {
        let nonBouncePadding = self.calculatePaddingToAvoidBounceOnToggle()
        let textEdgeInsets = EdgeInsets(top: 10, leading: 0, bottom: nonBouncePadding, trailing: 0)
        let secureEdgeInsets = EdgeInsets(top: 10, leading: 0, bottom: 1, trailing: 0)
        
        return VStack {
            if self.showPassword {
                TextField(self.label, text: $secureText)
                    .autocapitalization(.none)
                    .padding(textEdgeInsets)
                
            } else {
                SecureField(self.label, text: $secureText)
                    .padding(secureEdgeInsets)
            }
        }
    }
    
    private func calculatePaddingToAvoidBounceOnToggle() -> CGFloat {
        let notEmptyPadding: CGFloat = 1
        let emptyPadding: CGFloat = 0
        
        return self.secureText.count > 0 ? notEmptyPadding : emptyPadding
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
