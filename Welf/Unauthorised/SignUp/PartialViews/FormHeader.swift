//
//  FormHeader.swift
//  Welf
//
//  Created by Clem on 18/06/2020.
//  Copyright © 2020 Clem. All rights reserved.
//

import SwiftUI

struct FormHeader: View {
    @EnvironmentObject private var signUpService: SignUpService
    
    var body: some View {
        HStack {
            PageControl(currentPage: (self.signUpService.currentPage-1), totalNumberOfPages: self.signUpService.totalNumberOfPages)
            Spacer()
            Text("\(self.signUpService.currentPage)/\(self.signUpService.totalNumberOfPages)")
        }
        .padding(EdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 0))
    }
}

struct FormHeader_Previews: PreviewProvider {
    static var previews: some View {
        FormHeader().environmentObject(SignUpService())
    }
}
