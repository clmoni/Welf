//
//  KeyboardAwareModifier.swift
//  Welf
//
//  Created by Clement Oniovosa on 18/05/2020.
//  Copyright © 2020 Clement Oniovosa. All rights reserved.
//

import SwiftUI
import Combine

struct KeyboardAwareModifier: ViewModifier {
    var placeButtonOnTopOfKeyboard: Bool = false
    @State private var keyboardHeight: CGFloat = 0
    @State private var keyboardOffset: CGFloat = 0

    private var keyboardHeightPublisher: AnyPublisher<CGFloat, Never> {
        Publishers.Merge(
            NotificationCenter.default
                .publisher(for: UIResponder.keyboardWillShowNotification)
                .compactMap { $0.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue }
                .map { $0.cgRectValue.height },
            NotificationCenter.default
                .publisher(for: UIResponder.keyboardWillHideNotification)
                .map { _ in CGFloat(0) }
       ).eraseToAnyPublisher()
    }

    func body(content: Content) -> some View {
        content
            .padding(.bottom, self.keyboardHeight)
            .offset(y: self.keyboardOffset)
            .onReceive(keyboardHeightPublisher) {
                self.keyboardHeight = $0
                self.keyboardOffset = self.placeButtonOnTopOfKeyboard ? $0/4.5 : 0
        }
    }
}

extension View {
    func KeyboardAwarePadding(placeButtonOnTopOfKeyboard: Bool = false) -> some View {
        ModifiedContent(content: self, modifier: KeyboardAwareModifier(placeButtonOnTopOfKeyboard: placeButtonOnTopOfKeyboard))
    }
}
