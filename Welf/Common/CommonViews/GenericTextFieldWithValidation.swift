//
// GenericTextFieldWithValidation.swift
// Welf
//
//  Created by Clem on 21/06/2020.
// Copyright © 2020 Clem. All rights reserved.
//

import SwiftUI

struct GenericTextFieldWithValidation: View {
    @Binding var text: String
    @Binding var isValidEntry: Bool
    var label: String
    var autocapitalization: UITextAutocapitalizationType = .none
    
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
        if self.$text.wrappedValue.count > 0 && self.isValidEntry {
            validationIcon = Image(systemName: "checkmark.circle")
        }
        else if self.$text.wrappedValue.count > 0 && !self.isValidEntry {
            validationIcon = Image(systemName: "exclamationmark.circle")
        }
        
        return validationIcon?
            .foregroundColor(self.isValidEntry ? .green : .red)
    }
}

struct GenericTextFieldWithValidation_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GenericTextFieldWithValidation(text: .constant("valid entry"), isValidEntry: .constant(true), label: "")

            GenericTextFieldWithValidation(text: .constant("invalid entry"), isValidEntry: .constant(false), label: "")

            GenericTextFieldWithValidation(text: .constant(""), isValidEntry: .constant(false), label: "")
        }
    }
}
