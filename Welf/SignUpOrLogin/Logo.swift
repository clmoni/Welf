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
                .padding(.all)
                .frame(width: 100.0, height: 100.0)
                .scaledToFit()
        }
    }
}

struct Logo_Previews: PreviewProvider {
    static var previews: some View {
        Logo()
    }
}
