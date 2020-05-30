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
    
    var body: some View {
        VStack {
            TextField(self.label, text: $text)
                .autocapitalization(.none)
                .padding(.top, 10)
            Divider()
                .frame(height: 1)
                .background(Color.green)
        }
    }
}

struct GenericTextField_Previews: PreviewProvider {
    static var previews: some View {
        GenericTextField(label: "", text: .constant(""))
    }
}
