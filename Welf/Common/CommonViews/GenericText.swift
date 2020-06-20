//
//  GenericText.swift
//  Welf
//
//  Created by Clem on 06/03/2020.
//  Copyright © 2020 Clem. All rights reserved.
//

import SwiftUI

struct GenericText: View {
    var font: Font = .caption
    var text: String = ""
    var weight: Font.Weight = .regular
    var colour: Color = .primary
    
    var body: some View {
        Text(self.text)
            .font(self.font)
            .fontWeight(self.weight)
            .foregroundColor(self.colour)
    }
}

struct GenericText_Previews: PreviewProvider {
    static var previews: some View {
        GenericText(text: "test value")
    }
}
