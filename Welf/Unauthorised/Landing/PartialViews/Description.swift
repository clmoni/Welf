//
//  Description.swift
//  Welf
//
//  Created by Clem on 06/03/2020.
//  Copyright © 2020 Clem. All rights reserved.
//

import SwiftUI

struct Description: View {
    
    let mainText: String = "One stop place to\nkeep track of my\nfinances"
    let secondaryText: String = "For personal use..."
    
    var body: some View {
        VStack() {
            GenericText(
                font: .largeTitle, text: mainText,
                weight: .bold,
                colour: .green)
                .padding(.vertical)
                .frame(maxWidth: .infinity, alignment: .leading)
                .layoutPriority(1)

            GenericText(
                font: .footnote, text: secondaryText,
                weight: .light
                )
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct Description_Previews: PreviewProvider {
    static var previews: some View {
        Description()
    }
}
