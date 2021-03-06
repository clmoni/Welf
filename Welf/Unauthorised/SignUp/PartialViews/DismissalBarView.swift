//
//  CreateAccountDismissalBarView.swift
//  Welf
//
//  Created by Clem on 29/05/2020.
//  Copyright © 2020 Clem. All rights reserved.
//

import SwiftUI

struct DismissalBarView: View {
    var viewTitle: String
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack {
            HStack {
                Button(action: { self.dismissRegistrationModalView() }) {
                    Image(systemName: "xmark")
                        .font(.system(size: 20))
                        .foregroundColor(Color.green)
                }
                
                Spacer()
                
                Text(viewTitle)
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
    
    private func dismissRegistrationModalView() {
        print("dismisses form")
        self.presentationMode.wrappedValue.dismiss()
    }
}

struct DismissalBarView_Previews: PreviewProvider {
    static var previews: some View {
        DismissalBarView(viewTitle: "Create account")
    }
}
