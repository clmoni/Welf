//
//  UserAuthenticationState.swift
//  Welf
//
//  Created by Clem on 03/06/2020.
//  Copyright © 2020 Clem. All rights reserved.
//

import SwiftUI

struct UserAuthenticationState {
    var isSignedIn: Bool = false
    var isSigningIn: Bool = false
    var isBadCredentialsSignInError: Bool = false
    var isNonUserFaultSignInError: Bool = false
}

