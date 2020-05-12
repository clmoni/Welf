//
//  UserData.swift
//  Welf
//
//  Created by Clement Oniovosa on 12/05/2020.
//  Copyright © 2020 Clement Oniovosa. All rights reserved.
//

import Combine
import SwiftUI

final class UserData: ObservableObject {
    @Published var isSignedIn : Bool = false
}
