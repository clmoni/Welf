//
//  LoginHeaderView.swift
//  Welf
//
//  Created by Clement Oniovosa on 27/05/2020.
//  Copyright © 2020 Clement Oniovosa. All rights reserved.
//

import SwiftUI

struct LoginButtonCancelText: View {
    var body: some View {
        VStack {
            GenericText (
                font: .headline,
                text: "Cancel",
                weight: .regular,
                colour: .green
            )
            .frame(maxWidth: .infinity, maxHeight: 40, alignment: .center)
        }
    }
}

struct LoginButtonCancelText_Previews: PreviewProvider {
    static var previews: some View {
        LoginButtonCancelText()
    }
}
