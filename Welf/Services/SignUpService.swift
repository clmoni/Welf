//
//  SignUpViewModel.swift
//  Welf
//
//  Created by Clem on 09/06/2020.
//  Copyright © 2020 Clem. All rights reserved.
//

import SwiftUI
import Combine
import AWSMobileClient

class SignUpService: ObservableObject {
    @Published var currentPage: Int = 1
    @Published var isSigningUp: Bool = false
    @Published var isSignUpSuccessful: Bool = false
    @Published var confirmationCodeDestination: String? = nil
    @Published var verificationCode: String = ""
    @Published var errorOccurredOnVerification: Bool = false
    @Published var isSuccessfulVerification: Bool = false
    var totalNumberOfPages: Int = 4
    var firstPage: Int = 1
    
    public var isVerificationCodeReadyToSendPublisher: AnyPublisher<Bool, Never> {
        $verificationCode
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { input in
                print(input)
                return input.isEmpty
        }
        .eraseToAnyPublisher()
    }
    
    
    public func verifyAccountWithVerificationCode(verificationDto: VerificationDto) {
        self.isSigningUp = true
        AWSMobileClient.default().confirmSignUp(username: verificationDto.username, confirmationCode: verificationDto.confirmationCode) { (signUpResult, error) in
            DispatchQueue.main.async {
                if let error = error as? AWSMobileClientError {
                    print("\(error)")
                    self.errorOccurredOnVerification = true
                    self.isSuccessfulVerification = false
                    self.isSigningUp = false
                } else if let signUpResult = signUpResult {
                    print("\(signUpResult)")
                    self.isSuccessfulVerification = true
                    self.isSigningUp = false
                }
            }
        }
    }
    
    public func signUp (_ signUpData: SignUpDto) {
        let userAttributes = self.putSignUpDataInUserAttributeDictionary(signUpData)
        self.changeSigningUpState(isSigningUp: true)
        AWSMobileClient.default().signUp(username: signUpData.username, password: signUpData.password, userAttributes: userAttributes) { (signUpResult, error) in
            if let error = error as? AWSMobileClientError {
                print("\(error)")
            } else if let signUpResult = signUpResult {
                print("\(signUpResult)")
                self.successfulSignUp(signUpResult: signUpResult)
            }
            self.changeSigningUpState(isSigningUp: false)
        }
    }
    
    public func goToNextPage() {
        KeyboardResponder.dismissKeyboard()
        if self.currentPage < self.totalNumberOfPages {
            withAnimation {
                DispatchQueue.main.async {
                    self.currentPage += 1
                }
            }
        }
    }
    
    public func goToPreviousPage() {
        KeyboardResponder.dismissKeyboard()
        if self.currentPage != self.firstPage {
            withAnimation {
                DispatchQueue.main.async {
                    self.currentPage -= 1
                }
            }
        }
    }
    
    private func putSignUpDataInUserAttributeDictionary (_ signUpData: SignUpDto) -> [String: String] {
        print(signUpData)
        return [
            "email": signUpData.emailAddress,
            "phone_number": signUpData.phoneNumber,
            "given_name": signUpData.firstName,
            "family_name": signUpData.lastName
        ]
    }
    
    private func successfulSignUp(signUpResult: SignUpResult) {
        DispatchQueue.main.async {
            self.isSignUpSuccessful = true
            self.confirmationCodeDestination = signUpResult.codeDeliveryDetails?.destination
        }
        self.goToNextPage()
    }
    
    private func changeSigningUpState(isSigningUp: Bool) {
        DispatchQueue.main.async {
            self.isSigningUp = isSigningUp
        }
    }
}
