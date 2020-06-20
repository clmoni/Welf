//
//  KeyboardRemovalOnTapOutModifier.swift
//  Welf
//
//  Created by Clem on 30/05/2020.
//  Copyright © 2020 Clem. All rights reserved.
//

import SwiftUI

struct KeyboardRemovalOnDragModifier: ViewModifier {
    func body(content: Content) -> some View {
        return content
            .gesture(
                DragGesture().onChanged { _ in
                    UIApplication.shared.dismissKeyboard()
            })
    }
}
