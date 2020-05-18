//
//  GenericButton.swift
//  Welf
//
//  Created by Clement Oniovosa on 06/03/2020.
//  Copyright © 2020 Clement Oniovosa. All rights reserved.
//

import SwiftUI

struct GenericButton: View {
    let text: String
    let action: () -> Void
    var radius: CGFloat = 8
    
    var body: some View {
        Button(action: self.action) {
            HStack {
                Spacer()
                Text(self.text)
                    .foregroundColor(Color.white)
                    .bold()
                Spacer()
            }
            .padding()
            .background(Color.green)
            .cornerRadius(self.radius)
        }
    }
}

struct GenericButton_Previews: PreviewProvider {
    static var previews: some View {
        GenericButton(text: "test button", action: {})
    }
}
