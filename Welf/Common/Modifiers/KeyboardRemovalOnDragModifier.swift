//
//  KeyboardRemovalOnTapOutModifier.swift
//  Welf
//
//  Created by Clement Oniovosa on 30/05/2020.
//  Copyright © 2020 Clement Oniovosa. All rights reserved.
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
