//
//  GenericTextField.swift
//  Welf
//
//  Created by Clement Oniovosa on 30/05/2020.
//  Copyright © 2020 Clement Oniovosa. All rights reserved.
//

import SwiftUI

struct GenericTextField: View {
    var label: String
    @Binding var text: String
    var autocapitalization: UITextAutocapitalizationType = .none
    var withValidation: Bool = false
    var isValidEntry: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                TextField(self.label, text: $text)
                    .autocapitalization(self.autocapitalization)
                
                self.createValidationIcon()
                    .animation(.easeInOut(duration: 5))
            }
            .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
            
            Divider()
                .frame(height: 1)
                .background(Color.green)
        }
    }
    
    private func createValidationIcon() -> some View {
        var validationIcon: Image? = nil
        if self.withValidation {
            if self.$text.wrappedValue.count > 0 && self.isValidEntry {
                validationIcon = Image(systemName: "checkmark.circle")
            }
            else if self.$text.wrappedValue.count > 0 && !self.isValidEntry {
                validationIcon = Image(systemName: "exclamationmark.circle")
            }
        }
        return validationIcon?
            .foregroundColor(self.isValidEntry ? .green : .red)
    }
}

struct GenericTextField_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GenericTextField(label: "", text: .constant("without validation entry"))
            
            GenericTextField(label: "", text: .constant("valid entry"), withValidation: true, isValidEntry: true)
            
            GenericTextField(label: "", text: .constant("invalid entry"), withValidation: true, isValidEntry: false)
            
            GenericTextField(label: "", text: .constant(""), withValidation: true, isValidEntry: false)
        }
    }
}
