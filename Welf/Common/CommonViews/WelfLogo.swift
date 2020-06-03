//
//  GenericAvatar.swift
//  Welf
//
//  Created by Clement Oniovosa on 17/05/2020.
//  Copyright © 2020 Clement Oniovosa. All rights reserved.
//

import SwiftUI

struct WelfLogo: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack {
                    ZStack {
                        Circle()
                            .stroke(Color.yellow, lineWidth: geometry.size.width)
                            .frame(width:geometry.size.width, height:geometry.size.width / 1.2, alignment: .center)
                        
                        Circle()
                            .stroke(Color.green, lineWidth: geometry.size.width/5)
                            .frame(width:geometry.size.width/2, height:geometry.size.width, alignment: .center)
                    }
                    
                }
                Circle()
                    .stroke(Color.green, lineWidth: geometry.size.width/55.0)
            }
            .clipShape(Circle())
            .shadow(radius: geometry.size.width/30.0)
            .frame(maxWidth: geometry.size.width, maxHeight: geometry.size.height/2)
        }
    }
}

struct WelfLogo_Previews: PreviewProvider {
    static var previews: some View {
        WelfLogo()
    }
}
