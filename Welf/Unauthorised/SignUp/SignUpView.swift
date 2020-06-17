//
//  SignUppView.swift
//  Welf
//
//  Created by Clement Oniovosa on 14/06/2020.
//  Copyright © 2020 Clement Oniovosa. All rights reserved.
//

import SwiftUI

struct SignUpView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject private var signUpViewModel = SignUpViewModel()
    @ObservedObject private var keyboard = KeyboardResponder()
    @State var currentPage: Int = 1
    @State private var showDetails: Bool = false
    private var totalNumberOfPages: Int = 3
    private var firstPage: Int = 1
    private var registrationService = RegistrationService()

    var body: some View {
        GeometryReader { geometry in
            VStack {
                CreateAccountDismissalBarView(dismiss: self.dismissRegistrationModalView)
                VStack {
                    VStack {
                        //FormHeader
                        HStack {
                            PageControl(currentPage: (self.currentPage-1), totalNumberOfPages: self.totalNumberOfPages)
                            Spacer()
                            Text("\(self.currentPage)/3")
                        }
                        .padding(EdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 0))
                        
                        //PagedForm
                        ZStack {
                            if self.currentPage == 1 {
                                VStack{
                                    GenericTextField(label: "First name", text: self.$signUpViewModel.firstName, autocapitalization: .sentences)
                                    GenericTextField(label: "Last name", text: self.$signUpViewModel.lastName, autocapitalization: .sentences)
                                }
                                .transition(.move(edge: .leading))
                            } else if self.currentPage == 2 {
                                VStack {
                                    GenericTextField(label: "User name", text: self.$signUpViewModel.username)
                                    GenericSecureField(label: "Password", showPassword: self.$signUpViewModel.showPassword, secureText: self.$signUpViewModel.password)
                                }
                                .transition(.move(edge: .leading))
                            } else {
                                VStack {
                                    GenericTextField(label: "Email address", text: self.$signUpViewModel.emailAddress)
                                    GenericTextField(label: "Phone number", text: self.$signUpViewModel.phoneNumber)
                                }
                                .transition(.move(edge: .leading))
                            }
                        }
                    }
                    
                    Spacer()
                    
                    VStack {
                        HStack {
                            self.creatBackButton()
                            Spacer()
                            self.createProgressionButton()
                        }
                    }
                    .padding(self.calculateNextButtonPadding(geometry))
                    .offset(y: self.getOffset(geometry))
                }
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
            }
            .animation(.easeInOut(duration: 0.5))
        }
    }
    
    private func createProgressionButton() -> Button<Text> {
        if self.currentPage == self.totalNumberOfPages  {
            return self.creatSignUpButton()
            
//            GenericResizeableButton(text: "Next", radius: 8, height: 25, action: self.signUp)
//                .padding(self.calculateNextButtonPadding(geometry))
//                .offset(y: self.getOffset(geometry))
        }
        
        return self.creatNextButton()
    }
    
    private func creatNextButton() -> Button<Text> {
        Button(action: {self.goToNextPage()}) {
            Text("Next")
        }
    }
    
    private func creatBackButton() -> Button<Text> {
        Button(action: {self.goToPreviousPage()}) {
            Text("Back")
        }
    }
    
    private func creatSignUpButton() -> Button<Text> {
        Button(action: {print(self.signUpViewModel.emailAddress)}) {
            Text("Sign Up")
        }
    }
    
    private func calculateNextButtonPadding(_ geometry: GeometryProxy) -> EdgeInsets {
        EdgeInsets(
            top: 0,
            leading: 0,
            bottom: self.keyboard.calculateMovingPadding(geometry),
            trailing: 0
        )
    }
    
    private func getOffset(_ geometry: GeometryProxy) -> CGFloat {
        let zeroBottomSafeArea: CGFloat = 0
        let zeroOffet: CGFloat = keyboard.isKeyboardPoppingOut() ? -20 : 0
        let bottomOffsetWhenNoBottomSafeArea: CGFloat = keyboard.isKeyboardPoppingOut() ? 0 : -20
        
        return geometry.safeAreaInsets.bottom > zeroBottomSafeArea ?
            zeroOffet :
        bottomOffsetWhenNoBottomSafeArea
    }
    
    private func goToPreviousPage() {
        KeyboardResponder.dismissKeyboard()
        if self.currentPage != self.firstPage {
            withAnimation {
                self.currentPage -= 1
            }
        }
    }
    
    private func goToNextPage() {
        KeyboardResponder.dismissKeyboard()
        if self.currentPage < self.totalNumberOfPages {
            withAnimation {
                self.currentPage += 1
            }
        }
    }
    
    private func dismissRegistrationModalView() {
        print("dismisses form")
        self.presentationMode.wrappedValue.dismiss()
    }
    
    private func signUp() {
        self.registrationService.signUp(username: signUpViewModel.username, password: signUpViewModel.password, email: signUpViewModel.emailAddress, phoneNumber: signUpViewModel.phoneNumber)
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
