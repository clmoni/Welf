//
//  UserData.swift
//  Welf
//
//  Created by Clement Oniovosa on 12/05/2020.
//  Copyright © 2020 Clement Oniovosa. All rights reserved.
//

import SwiftUI

final class User: ObservableObject {
    @Published var authenticationState = UserAuthenticationState()
}
