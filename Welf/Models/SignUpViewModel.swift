//
//  SignUpViewModel.swift
//  Welf
//
//  Created by Clement Oniovosa on 09/06/2020.
//  Copyright © 2020 Clement Oniovosa. All rights reserved.
//

import SwiftUI

class SignUpViewModel: ObservableObject {
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var emailAddress: String = ""
    @Published var phoneNumber: String = ""
    @Published var showPassword: Bool = false
}
