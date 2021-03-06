//
//  GenericNavigationButton.swift
//  Welf
//
//  Created by Clem on 07/03/2020.
//  Copyright © 2020 Clem. All rights reserved.
//

import SwiftUI

struct GenericNavigationButton<Destination>: View where Destination : View {
    let text: GenericText
    let destination: Destination
    let radius: CGFloat = 8
    
    var body: some View {
        NavigationLink(destination: self.destination) {
            self.text
            .multilineTextAlignment(.center)
        }
        .buttonStyle(PlainButtonStyle())
        .padding()
        .frame(minWidth: 0, maxWidth: .infinity)
        .background(Color.green)
        .cornerRadius(self.radius)
    }
}

struct GenericNavigationButton_Previews: PreviewProvider {
    static var previews: some View {
        GenericNavigationButton(text: GenericText(text: "Test Navigation Link"), destination: SignUpView())
    }
}
