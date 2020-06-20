//
//  UserData.swift
//  Welf
//
//  Created by Clem on 12/05/2020.
//  Copyright © 2020 Clem. All rights reserved.
//

import SwiftUI

final class User: ObservableObject {
    @Published var authenticationState = UserAuthenticationState()
}
