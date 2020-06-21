//
//  GenericTextField.swift
//  Welf
//
//  Created by Clem on 30/05/2020.
//  Copyright © 2020 Clem. All rights reserved.
//

import SwiftUI

struct GenericTextField: View {
    var label: String
    @Binding var text: String
    var autocapitalization: UITextAutocapitalizationType = .none
    
    var body: some View {
        VStack {
            HStack {
                TextField(self.label, text: $text)
                    .autocapitalization(self.autocapitalization)
            }
            .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
            
            Divider()
                .frame(height: 1)
                .background(Color.green)
        }
    }
}

struct GenericTextField_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GenericTextField(label: "", text: .constant("without validation entry"))
        }
    }
}
