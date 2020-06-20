//
//  SignUppView.swift
//  Welf
//
//  Created by Clement Oniovosa on 14/06/2020.
//  Copyright © 2020 Clement Oniovosa. All rights reserved.
//

import SwiftUI

struct SignUpView: View {
    @Environment(\.presentationMode) private var _presentationMode: Binding<PresentationMode>
    @ObservedObject private var _signUpViewModel = SignUpViewModel()
    @ObservedObject private var _keyboard = KeyboardResponder()
    private var _registrationService = RegistrationService()
    
    var keyboard: KeyboardResponder {
        get {
            return _keyboard
        }
    }
    
    var signUpViewModel: SignUpViewModel {
        get {
            return _signUpViewModel
        }
    }
    
    var registrationService: RegistrationService {
        get {
            return _registrationService
        }
    }
    
    var presentationMode: Binding<PresentationMode> {
        get {
            return _presentationMode
        }
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                CreateAccountDismissalBarView(dismiss: self.dismissRegistrationModalView)
                VStack {
                    VStack {
                        FormHeader(currentPage: self._signUpViewModel.currentPage, totalNumberOfPages: self._signUpViewModel.totalNumberOfPages)
                        PagedForm(signUpViewModel: self.signUpViewModel)
                    }
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                    .animation(.easeInOut(duration: 0.7))
                    
                    Spacer()
                    
                    VStack {
                        Divider()
                            .frame(height: 0.5)
                            .background(Color.green)
                        HStack {
                            BackButton(signUpViewModel: self.signUpViewModel, goToPreviousPage: self.goToPreviousPage)
                            Spacer()
                            ForwardButton(signUpViewModel: self.signUpViewModel, goToNextPage: self.goToNextPage)
                        }
                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                    }
                    .padding(self.calculateButtonPadding(geometry))
                    .offset(y: self.getOffset(geometry))
                }
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        return Group {
            Button(action: {}) {
                Text("Show SignUp View")
            }.sheet(isPresented: .constant(true)) {
                SignUpView()
            }
            .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
            .previewDisplayName("iPhone SE")
            
            Button(action: {}) {
                Text("Show SignUp View")
            }.sheet(isPresented: .constant(true)) {
                SignUpView()
            }
            .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
            .previewDisplayName("iPhone 8")
            
            Button(action: {}) {
                Text("Show SignUp View")
            }.sheet(isPresented: .constant(true)) {
                SignUpView()
            }
            .previewDevice(PreviewDevice(rawValue: "iPhone Xs Max"))
            .previewDisplayName("iPhone Xs Max")
        }
        .environmentObject(User())
        .environment(\.colorScheme, .dark)
    }
}
