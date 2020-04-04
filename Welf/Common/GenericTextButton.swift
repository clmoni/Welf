//
//  GenericTextButton.swift
//  Welf
//
//  Created by Clement Oniovosa on 06/03/2020.
//  Copyright © 2020 Clement Oniovosa. All rights reserved.
//

import SwiftUI

struct GenericTextButton: View {
    
    let text: GenericText
    let action: () -> Void
    
    var body: some View {
        Button(action: self.action) {
            self.text
        }
    }
}

struct GenericTextButton_Previews: PreviewProvider {
    static var previews: some View {
        GenericTextButton(text: GenericText("test value"), action: {})
    }
}
