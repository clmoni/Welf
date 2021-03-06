//
//  SignUppView.swift
//  Welf
//
//  Created by Clem on 14/06/2020.
//  Copyright © 2020 Clem. All rights reserved.
//

import SwiftUI

struct SignUpView: View {
    @EnvironmentObject private var signUpService: SignUpService
    @EnvironmentObject private var keyboard: KeyboardResponder
    
    var body: some View {
        GeometryReader { geometry in
            LoadingView(isShowing: self.$signUpService.isSigningUp, activityText: "Signing Up") {
                VStack {
                    DismissalBarView(viewTitle: "Create account")
                    VStack {
                        VStack {
                            FormHeader()
                            PagedForm()
                        }
                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                        .animation(.easeInOut(duration: 0.7))
                        
                        Spacer()
                        
                        VStack {
                            Divider()
                                .frame(height: 0.5)
                                .background(Color.green)
                            HStack {
                                BackButton()
                                Spacer()
                                ForwardButton()
                            }
                            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                        }
                        .padding(self.calculateButtonPadding(geometry, keyboard: self.keyboard))
                        .offset(y: self.getOffset(geometry, keyboard: self.keyboard))
                    }
                }
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE", "iPhone XS Max", "iPhone 8"], id: \.self) { deviceName in
            Button(action: {}) {
                Text("Show SignUp View")
            }.sheet(isPresented: .constant(true)) {
                SignUpView()
                    .injectSystemServices()
            }
            .previewDevice(PreviewDevice(rawValue: deviceName))
            .environment(\.colorScheme, .dark)
        }
    }
}
