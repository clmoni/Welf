//
//  CreateAccountDismissalBarView.swift
//  Welf
//
//  Created by Clement Oniovosa on 29/05/2020.
//  Copyright © 2020 Clement Oniovosa. All rights reserved.
//

import SwiftUI

struct CreateAccountDismissalBarView: View {
    var dismiss: () -> ()
    
    var body: some View {
        HStack {
            Button(action: { self.dismiss() }) {
                Image(systemName: "xmark")
                    .font(.system(size: 20))
                    .foregroundColor(Color.green)
            }
            
            Spacer()
            
            Text("Create account")
                .fontWeight(.bold)
                .foregroundColor(Color.primary)
            
            Spacer()
            
        }
        .offset(y: -265)
    }
}

struct CreateAccountDismissalBarView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountDismissalBarView(dismiss: {})
    }
}
