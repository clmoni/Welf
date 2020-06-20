//
//  SignUpViewModel.swift
//  Welf
//
//  Created by Clem on 09/06/2020.
//  Copyright © 2020 Clem. All rights reserved.
//

import SwiftUI
import Combine

class SignUpViewModel: ObservableObject {
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var emailAddress: String = ""
    @Published var phoneNumber: String = ""
    @Published var showPassword: Bool = false
    @Published var currentPage: Int = 1
    var disableFirstPageNextButton: Bool = true
    var disableSecondPageNextButton: Bool = true
    var disableSignUpButton: Bool = true
    var totalNumberOfPages: Int = 3
    var firstPage: Int = 1
}
