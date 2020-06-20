//
//  UIApplication.swift
//  Welf
//
//  Created by Clem on 30/05/2020.
//  Copyright © 2020 Clem. All rights reserved.
//

import SwiftUI

extension UIApplication {
    func dismissKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
    }
}
