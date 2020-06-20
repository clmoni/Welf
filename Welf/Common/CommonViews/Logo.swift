//
//  Logo.swift
//  Welf
//
//  Created by Clem on 06/03/2020.
//  Copyright © 2020 Clem. All rights reserved.
//

import SwiftUI

struct Logo: View {
    var width: CGFloat = 80.0
    var height: CGFloat = 80.0
    var contentMode: ContentMode = .fit
    
    var body: some View {
        Image("lemon-logo")
            .resizable()
            .aspectRatio(contentMode: contentMode)
            .frame(width: width, height: height)
            .rotationEffect(.degrees(80))
    }
}

struct Logo_Previews: PreviewProvider {
    static var previews: some View {
        Logo()
    }
}
