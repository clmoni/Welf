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
        VStack {
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
            .padding(EdgeInsets(top: 25, leading: 20, bottom: 0, trailing: 20))

            Divider()
                .frame(height: 1)
                .background(Color.green)
        }
    }
}

struct CreateAccountDismissalBarView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountDismissalBarView(dismiss: {})
    }
}