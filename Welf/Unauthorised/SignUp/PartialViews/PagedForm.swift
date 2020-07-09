//
//  PagedForm.swift
//  Welf
//
//  Created by Clem on 18/06/2020.
//  Copyright © 2020 Clem. All rights reserved.
//

import SwiftUI
import Foundation

struct PagedForm: View {
    @EnvironmentObject private var signUpService: SignUpService
    
    var body: some View {
        ZStack {
            if self.signUpService.currentPage == 1 {
                FirstStep()
            } else if self.signUpService.currentPage == 2 {
                SecondStep()
            } else if self.signUpService.currentPage == 3 {
                FinalStep()
            } else {
                Text(verbatim: "Confirm code here")
            }
        }
    }
}

struct PagedForm_Previews: PreviewProvider {
    static var previews: some View {
        PagedForm()
            .injectSystemServices()
    }
}

