//
//  HostingController.swift
//  Welf
//
//  Created by Clement Oniovosa on 21/03/2020.
//  Copyright © 2020 Clement Oniovosa. All rights reserved.
//

import UIKit
import SwiftUI
class HostingController<Content> : UIHostingController<Content> where Content : View {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
}
