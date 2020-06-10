//
//  SignUp.swift
//  Welf
//
//  Created by Clement Oniovosa on 07/03/2020.
//  Copyright © 2020 Clement Oniovosa. All rights reserved.
//

import SwiftUI

struct SignUpView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    private var registrationService = RegistrationService()
    @ObservedObject private var signUpViewModel = SignUpViewModel()
    //@ObservedObject private var keyboard = KeyboardResponder()
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                CreateAccountDismissalBarView(dismiss: self.dismissRegistrationModalView)
                    .offset(y: -(self.getOffset(geometry, divisor: 4.2)))
                
                VStack {
                    Group {
                        GenericTextField(label: "User name", text: self.$signUpViewModel.username)
                        
                        GenericSecureField(label: "Password", showPassword: self.$signUpViewModel.showPassword, secureText: self.$signUpViewModel.password)
                        
                        GenericSecureField(label: "Confirm password", showPassword: self.$signUpViewModel.showPasswordConfirmation, secureText: self.$signUpViewModel.passwordConfirmation)
                        
                        GenericTextField(label: "Email address", text: self.$signUpViewModel.emailAddress)
                        
                        GenericTextField(label: "Phone number", text: self.$signUpViewModel.phoneNumber)
                    }
                }
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                .offset(y: -(self.getOffset(geometry, divisor: 4.2)))
                
                GenericResizeableButton(text: "Next", radius: 8, height: 25, action: self.signUp)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                    .offset(y: self.getOffset(geometry, divisor: 5.3))
                    .keyboardAwarePadding(placeButtonOnTopOfKeyboard: true)
            }
        }
    }
    
    private func getOffset(_ geometry: GeometryProxy, divisor: CGFloat) -> CGFloat {
        let defaultPadding = geometry.safeAreaInsets.bottom/2.5
        let screenWithTopInsetDivisorOffset: CGFloat = 0.6
        let deviceSpecificDivisor = defaultPadding > 0 ? (divisor - screenWithTopInsetDivisorOffset) : divisor
        
        let offset = defaultPadding > 0 ?
            geometry.size.height/deviceSpecificDivisor + defaultPadding :
            geometry.size.height/deviceSpecificDivisor
        
        return offset
    }
    
    private func signUp() {
        self.registrationService.signUp(username: signUpViewModel.username, password: signUpViewModel.password, email: signUpViewModel.emailAddress, phoneNumber: signUpViewModel.phoneNumber)
    }
    
    private func dismissRegistrationModalView() {
        print("dismisses form")
        self.presentationMode.wrappedValue.dismiss()
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

