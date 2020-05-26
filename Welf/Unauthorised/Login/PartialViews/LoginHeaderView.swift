//
//  LoginHeaderView.swift
//  Welf
//
//  Created by Clement Oniovosa on 27/05/2020.
//  Copyright © 2020 Clement Oniovosa. All rights reserved.
//

import SwiftUI

struct LoginHeaderView: View {
    var body: some View {
        VStack {
            VStack {
                WelfLogo()
                    .scaleEffect(0.1)
            }
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            .frame(maxHeight: 1)
            .offset(y: -230)
            
            VStack {
                Text(verbatim: "Login")
                    .bold()
                    .font(.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .offset(y: -210)
            .padding(20)
        }
    }
}

struct LoginHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        LoginHeaderView()
    }
}
