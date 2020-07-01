//
// ContactDetailsService.swift
// Welf
//
//  Created by Clem on 01/07/2020.
// Copyright © 2020 Clem. All rights reserved.
//

import SwiftUI
import Combine

class ContactDetailsService: ObservableObject {
    @Published var emailAddress: String = ""
    @Published var phoneNumber: String = ""
}
