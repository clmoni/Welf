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
    var radius: CGFloat = 20
    
    var body: some View {
        Button(action: self.action) {
            HStack {
                Text(self.text)
                    .foregroundColor(Color.white)
                    .bold()
            }
            .padding(EdgeInsets(top: 6, leading: 10, bottom: 6, trailing: 10))

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
