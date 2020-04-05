//
//  Logo.swift
//  Welf
//
//  Created by Clement Oniovosa on 06/03/2020.
//  Copyright © 2020 Clement Oniovosa. All rights reserved.
//

import SwiftUI

struct Logo: View {
    var body: some View {
        VStack(alignment: .center) {
            Image("lemon-logo")
                .resizable()
                .frame(width: 80.0, height: 80.0)
                .rotationEffect(.degrees(80))
        }
    }
}

struct Logo_Previews: PreviewProvider {
    static var previews: some View {
        Logo()
    }
}
