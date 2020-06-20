//
//  ViewExtensions.swift
//  Welf
//
//  Created by Clem on 30/05/2020.
//  Copyright © 2020 Clem. All rights reserved.
//

import SwiftUI

extension View {
    func keyboardAwarePadding(placeButtonOnTopOfKeyboard: Bool = false, avoidEntireContent: Bool = false) -> some View {
        ModifiedContent(content: self, modifier: KeyboardAwareModifier(placeButtonOnTopOfKeyboard: placeButtonOnTopOfKeyboard, avoidEntireContent: avoidEntireContent))
    }
    
    func dismissKeyboardOnDrag() -> some View {
        ModifiedContent(content: self, modifier: KeyboardRemovalOnDragModifier())
    }
}
