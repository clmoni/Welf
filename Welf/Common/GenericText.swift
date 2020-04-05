//
//  GenericText.swift
//  Welf
//
//  Created by Clement Oniovosa on 06/03/2020.
//  Copyright © 2020 Clement Oniovosa. All rights reserved.
//

import SwiftUI

struct GenericText: View {
    let font: Font
    let text: String
    let weight: Font.Weight
    let colour: Color
    
    init(_ text: String,
         font: Font = .caption,
         weight: Font.Weight = .regular,
         colour: Color = .primary){
        self.text = text
        self.font = font
        self.weight = weight
        self.colour = colour
    }
    
    var body: some View {
        Text(self.text)
            .font(self.font)
            .fontWeight(self.weight)
            .foregroundColor(self.colour)
    }
}

struct GenericText_Previews: PreviewProvider {
    static var previews: some View {
        GenericText("test value")
    }
}
