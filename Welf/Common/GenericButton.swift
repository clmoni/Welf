//
//  GenericButton.swift
//  Welf
//
//  Created by Clement Oniovosa on 06/03/2020.
//  Copyright © 2020 Clement Oniovosa. All rights reserved.
//

import SwiftUI

struct GenericButton: View {
    let text: GenericText
    let action: () -> Void
    let radius: CGFloat = 8
    
    var body: some View {
        Button(action: self.action) {
            VStack {
                self.text
                .multilineTextAlignment(.center)
            }
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(Color.green)
            .cornerRadius(self.radius)
        }
    }
}

struct GenericButton_Previews: PreviewProvider {
    static var previews: some View {
        GenericButton(text: GenericText("test button"), action: {})
    }
}
