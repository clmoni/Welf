//
//  UserAuthenticationState.swift
//  Welf
//
//  Created by Clement Oniovosa on 03/06/2020.
//  Copyright © 2020 Clement Oniovosa. All rights reserved.
//

import SwiftUI

struct UserAuthenticationState {
    var isSignedIn: Bool = false
    var isSigningIn: Bool = false
    var isBadCredentialsSignInError: Bool = false
    var isNonUserFaultSignInError: Bool = false
}

