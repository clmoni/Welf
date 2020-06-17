//
//  KeyboardResponder.swift
//  Welf
//
//  Created by Clement Oniovosa on 03/06/2020.
//  Copyright © 2020 Clement Oniovosa. All rights reserved.
//

import SwiftUI
import Combine

class KeyboardResponder: ObservableObject {
    private let willset = PassthroughSubject<CGFloat, Never>()
    private var _center: NotificationCenter
    @Published var currentHeight: CGFloat = 0
    private var keyboardDuration: TimeInterval = 0
    
    init(center: NotificationCenter = .default) {
        _center = center
        _center.addObserver(self, selector: #selector(keyBoardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        _center.addObserver(self, selector: #selector(keyBoardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    deinit {
        _center.removeObserver(self)
    }
    
    @objc func keyBoardWillShow(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            
            guard let duration:TimeInterval = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else { return }
            keyboardDuration = duration
            
            withAnimation(.easeInOut(duration: duration)) {
                self.currentHeight = keyboardSize.height
            }
        }
    }
    
    @objc func keyBoardWillHide(notification: Notification) {
        guard let duration:TimeInterval = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else { return }
        
        withAnimation(.easeInOut(duration: duration)) {
            currentHeight = 0
        }
    }
    
    public func calculateMovingPadding(_ geometry: GeometryProxy) -> CGFloat {
        let defaultPadding = geometry.safeAreaInsets.bottom/2.5
        let keyboardAwarePadding = self.currentHeight - geometry.safeAreaInsets.bottom
        
        return self.currentHeight == 0 ? defaultPadding : keyboardAwarePadding
    }
    
    public func isKeyboardPoppingOut() -> Bool {
        return self.currentHeight > 0
    }
    
    public static func dismissKeyboard() {
        UIApplication.shared.dismissKeyboard()
    }
}
