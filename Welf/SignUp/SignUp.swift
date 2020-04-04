//
//  SignUp.swift
//  Welf
//
//  Created by Clement Oniovosa on 07/03/2020.
//  Copyright © 2020 Clement Oniovosa. All rights reserved.
//

import SwiftUI

struct SignUp: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.white.edgesIgnoringSafeArea(.all)
                VStack {
                    GenericText("Choose your saving style 1")
                    Text("Whats UP").foregroundColor(.green)
                }
            }
            .frame(maxHeight: .infinity)
            .navigationBarTitle("Sign Up")
        }
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
        .environment(\.colorScheme, .dark)
    }
}
