//
//  GenericAvatar.swift
//  Welf
//
//  Created by Clement Oniovosa on 17/05/2020.
//  Copyright © 2020 Clement Oniovosa. All rights reserved.
//

import SwiftUI

struct GenericAvatar: View {
    var body: some View {
        GeometryReader { geometry in
        ZStack {
            
            VStack {
                ZStack {
                    Circle()
                        .frame(width:geometry.size.width / 2.0, height:geometry.size.width / 2.0, alignment: .center)
                        .foregroundColor(.yellow)
                        .offset(x:0, y:geometry.size.width/3.3)
                    Circle()
                        .stroke(Color.green, lineWidth: geometry.size.width/350.0)
                        .frame(width:geometry.size.width / 2.0, height:geometry.size.width / 2.0, alignment: .center)
                        .offset(x:0, y:geometry.size.width/3.3)
                }

                ZStack {
                    Circle()
                        .frame(width:geometry.size.width, height:geometry.size.width, alignment: .center)
                        .foregroundColor(.yellow)
                        .offset(x:0, y:geometry.size.width/3.0)
                    
                    Circle()
                        .stroke(Color.green, lineWidth: geometry.size.width/350.0)
                        .frame(width:geometry.size.width, height:geometry.size.width, alignment: .center)
                        .offset(x:0, y:geometry.size.width/3.0)
                }
                
            }
            Circle()
                .stroke(Color.green, lineWidth: geometry.size.width/50.0)
        }
        .clipShape(Circle())
        .shadow(radius: geometry.size.width/30.0)
        }
    }
}

struct GenericAvatar_Previews: PreviewProvider {
    static var previews: some View {
        GenericAvatar()
    }
}
