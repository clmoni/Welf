//
// SystemServices.swift
// Welf
//
//  Created by Clem on 29/06/2020.
// Copyright © 2020 Clem. All rights reserved.
//

import SwiftUI

struct SystemServices: ViewModifier {
    private let app = UIApplication.shared.delegate as! AppDelegate
    @ObservedObject private static var keyboard = KeyboardResponder()
    @ObservedObject private static var signUpService = SignUpService()
    @ObservedObject private static var nameService = NameService()
    @ObservedObject private static var userCredentialsService = UserCredentialsService()
    @ObservedObject private static var contactDetailsService = ContactDetailsService()
    
    func body(content: Content) -> some View {
        content
            .accentColor(.green)
            .environmentObject(self.app.authService)
            .environmentObject(Self.keyboard)
            .environmentObject(Self.signUpService)
            .environmentObject(Self.nameService)
            .environmentObject(Self.userCredentialsService)
            .environmentObject(Self.contactDetailsService)
    }
}
