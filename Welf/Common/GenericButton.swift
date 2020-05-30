//
//  GenericButton.swift
//  Welf
//
//  Created by Clement Oniovosa on 06/03/2020.
//  Copyright © 2020 Clement Oniovosa. All rights reserved.
//

import SwiftUI

struct GenericButton<T>: View where T : View {
    var isGenericButtonStyle: Bool = true
    let buttonDisplayView: T
    var genericButtonRadius: CGFloat = 20
    let action: () -> Void
    
    var body: some View {
        Button(action: self.action) {
            if self.isGenericButtonStyle {
                HStack {
                    self.buttonDisplayView
                        .foregroundColor(Color.white)
                }
                .padding(EdgeInsets(top: 6, leading: 10, bottom: 6, trailing: 10))
                .background(Color.green)
                .cornerRadius(genericButtonRadius)
            } else {
                self.buttonDisplayView
            }
        }
    }
}

struct GenericButton_Previews: PreviewProvider {
    static var previews: some View {
        GenericButton(buttonDisplayView: Text("test button"), action: {})
    }
}
