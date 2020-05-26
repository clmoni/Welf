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
    var avoidEntireContent: Bool = false
    let keyboardOffsetSubtractor: CGFloat = 656.0
    
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
            .padding(.bottom, avoidEntireContent ? self.keyboardHeight : 0)
            .offset(y: self.keyboardOffset)
            .onReceive(keyboardHeightPublisher) {
                let keyboardOffsetSubtractor: CGFloat = $0 == 0.0 ? $0 : self.keyboardOffsetSubtractor
                
                self.keyboardHeight = $0
                self.keyboardOffset = self.placeButtonOnTopOfKeyboard ? ($0-keyboardOffsetSubtractor) : 0
        }
    }
}

extension View {
    func KeyboardAwarePadding(placeButtonOnTopOfKeyboard: Bool = false, avoidEntireContent: Bool = false) -> some View {
        ModifiedContent(content: self, modifier: KeyboardAwareModifier(placeButtonOnTopOfKeyboard: placeButtonOnTopOfKeyboard, avoidEntireContent: avoidEntireContent))
    }
}
