//
//  GenericResizeableIconButton.swift
//  Welf
//
//  Created by Clement Oniovosa on 29/05/2020.
//  Copyright © 2020 Clement Oniovosa. All rights reserved.
//

import SwiftUI

struct GenericResizeableIconButton: View {
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
                Image(systemName: "person.badge.plus.fill")
                .foregroundColor(Color.white)
            }
            .frame(minWidth: 0, maxWidth: self.width, maxHeight: self.height)
            .padding(EdgeInsets(top: 6, leading: 10, bottom: 6, trailing: 10))
            .background(Color.green)
            .cornerRadius(self.radius)
        }
    }
}

struct GenericResizeableIconButton_Previews: PreviewProvider {
    static var previews: some View {
        GenericResizeableIconButton(text: "test button", action: {})
    }
}
