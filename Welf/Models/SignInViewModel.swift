//
//  SignInViewModel.swift
//  Welf
//
//  Created by Clement Oniovosa on 08/06/2020.
//  Copyright © 2020 Clement Oniovosa. All rights reserved.
//

import SwiftUI
import Combine

class SignInViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var showPassword: Bool = false
    @Published var showForgotPasswordView: Bool = false
    
    var showSignInbutton: AnyPublisher<Bool?, Never> {
      $username.combineLatest($password) { username, password in
        return username.isEmpty || password.isEmpty
      }
      .eraseToAnyPublisher()
    }

}
