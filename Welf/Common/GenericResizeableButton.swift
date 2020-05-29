//
//  GenericResizeableButton.swift
//  Welf
//
//  Created by Clement Oniovosa on 28/05/2020.
//  Copyright © 2020 Clement Oniovosa. All rights reserved.
//

import SwiftUI

struct GenericResizeableButton: View {
    let text: String
    var radius: CGFloat = 20
    var width: CGFloat = .infinity
    var height: CGFloat = 20
    let action: () -> Void
    
    var body: some View {
        Button(action: self.action) {
            HStack {
                Text(self.text)
                    .foregroundColor(Color.white)
                    .bold()
            }
            .frame(minWidth: 0, maxWidth: self.width, maxHeight: self.height)
            .padding(EdgeInsets(top: 6, leading: 10, bottom: 6, trailing: 10))
            .background(Color.green)
            .cornerRadius(self.radius)
        }
    }
}

struct GenericResizeableButton_Previews: PreviewProvider {
    static var previews: some View {
        GenericResizeableButton(text: "test button", action: {})
    }
}
