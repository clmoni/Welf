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
    
    func lockViewInPortraitMode() -> some View {
        ModifiedContent(content: self, modifier: PortraitOrientationLockModifier())
    }
    
    func injectSystemServices() -> some View {
        ModifiedContent(content: self, modifier: SystemServices())
    }
    
    func calculateButtonPadding(_ geometry: GeometryProxy, keyboard: KeyboardResponder) -> EdgeInsets {
        EdgeInsets(
            top: 0,
            leading: 0,
            bottom: keyboard.calculateMovingPadding(geometry),
            trailing: 0
        )
    }
    
    func getOffset(_ geometry: GeometryProxy, keyboard: KeyboardResponder) -> CGFloat {
        let zeroBottomSafeArea: CGFloat = 0
        let zeroOffet: CGFloat = keyboard.isKeyboardPoppingOut() ? -8 : 0
        return geometry.safeAreaInsets.bottom > zeroBottomSafeArea ?
            zeroOffet : -8
    }
}
