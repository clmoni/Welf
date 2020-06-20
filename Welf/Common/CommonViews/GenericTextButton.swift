//
//  GenericTextButton.swift
//  Welf
//
//  Created by Clem on 06/03/2020.
//  Copyright © 2020 Clem. All rights reserved.
//

import SwiftUI

struct GenericTextButton<Destination>: View where Destination : View  {
    let text: GenericText
    let destination: Destination
    
    var body: some View {
        NavigationLink(destination: self.destination) {
            self.text
        }
    }
}

struct GenericTextButton_Previews: PreviewProvider {
    static var previews: some View {
        GenericTextButton(text: GenericText(text: "Test Navigation Link"), destination: SignUpView())
    }
}

