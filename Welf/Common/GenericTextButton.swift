//
//  GenericTextButton.swift
//  Welf
//
//  Created by Clement Oniovosa on 06/03/2020.
//  Copyright © 2020 Clement Oniovosa. All rights reserved.
//

import SwiftUI

struct GenericTextButton<Destination>: View where Destination : View  {
    
    let text: GenericText
    let destination: Destination
    var isNavigationBarBackButtonHidden: Bool = false
    
    var body: some View {
        NavigationLink(destination: self.destination.navigationBarBackButtonHidden(self.isNavigationBarBackButtonHidden)) {
            self.text
        }
        
    }
}

struct GenericTextButton_Previews: PreviewProvider {
    static var previews: some View {
        GenericTextButton(text: GenericText(text: "Test Navigation Link"), destination: SignUpView())
    }
}
