//
//  ViewExtensions.swift
//  Welf
//
//  Created by Clement Oniovosa on 30/05/2020.
//  Copyright © 2020 Clement Oniovosa. All rights reserved.
//

import SwiftUI

extension View {
    func keyboardAwarePadding(placeButtonOnTopOfKeyboard: Bool = false, avoidEntireContent: Bool = false) -> some View {
        ModifiedContent(content: self, modifier: KeyboardAwareModifier(placeButtonOnTopOfKeyboard: placeButtonOnTopOfKeyboard, avoidEntireContent: avoidEntireContent))
    }
    
    func dismissKeyboardOnTap() -> some View {
        ModifiedContent(content: self, modifier: KeyboardRemovalOnTapOutModifier())
    }
}
