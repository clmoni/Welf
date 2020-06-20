//
//  SignInViewModel.swift
//  Welf
//
//  Created by Clem on 08/06/2020.
//  Copyright © 2020 Clem. All rights reserved.
//

import SwiftUI
import Combine

class SignInViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var showPassword: Bool = false
    @Published var showForgotPasswordView: Bool = false
    var disableLoginButton: Bool = true
    
    var showSignInbuttonPublisher: AnyPublisher<Bool?, Never> {
      $username.combineLatest($password) { username, password in
        return username.isEmpty || password.isEmpty
      }
      .eraseToAnyPublisher()
    }

}
