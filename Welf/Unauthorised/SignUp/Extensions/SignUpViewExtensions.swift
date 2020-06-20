//
//  SignUpViewExtensions.swift
//  Welf
//
//  Created by Clement Oniovosa on 18/06/2020.
//  Copyright © 2020 Clement Oniovosa. All rights reserved.
//

import SwiftUI

extension SignUpView {
    
    func calculateButtonPadding(_ geometry: GeometryProxy) -> EdgeInsets {
        EdgeInsets(
            top: 0,
            leading: 0,
            bottom: self.keyboard.calculateMovingPadding(geometry),
            trailing: 0
        )
    }
    
    func getOffset(_ geometry: GeometryProxy) -> CGFloat {
        let zeroBottomSafeArea: CGFloat = 0
        let zeroOffet: CGFloat = keyboard.isKeyboardPoppingOut() ? -8 : 0
        return geometry.safeAreaInsets.bottom > zeroBottomSafeArea ?
            zeroOffet : -8
    }
    
    func goToNextPage() {
        KeyboardResponder.dismissKeyboard()
        if signUpViewModel.currentPage < signUpViewModel.totalNumberOfPages {
            withAnimation {
                signUpViewModel.currentPage += 1
            }
        }
    }
    
    func goToPreviousPage() {
        KeyboardResponder.dismissKeyboard()
        if signUpViewModel.currentPage != signUpViewModel.firstPage {
            withAnimation {
                signUpViewModel.currentPage -= 1
            }
        }
    }
    
    func dismissRegistrationModalView() {
        print("dismisses form")
        self.presentationMode.wrappedValue.dismiss()
    }
    
    private func signUp() {
        self.registrationService.signUp(username: signUpViewModel.username, password: signUpViewModel.password, email: signUpViewModel.emailAddress, phoneNumber: signUpViewModel.phoneNumber)
    }
}
