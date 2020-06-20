//
//  HostingController.swift
//  Welf
//
//  Created by Clem on 21/03/2020.
//  Copyright © 2020 Clem. All rights reserved.
//

import UIKit
import SwiftUI
class HostingController<Content> : UIHostingController<Content> where Content : View {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
}
