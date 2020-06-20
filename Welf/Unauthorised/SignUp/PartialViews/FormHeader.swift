//
//  FormHeader.swift
//  Welf
//
//  Created by Clem on 18/06/2020.
//  Copyright © 2020 Clem. All rights reserved.
//

import SwiftUI

struct FormHeader: View {
    var currentPage: Int
    var totalNumberOfPages: Int
    
    var body: some View {
        HStack {
            PageControl(currentPage: (self.currentPage-1), totalNumberOfPages: self.totalNumberOfPages)
            Spacer()
            Text("\(self.currentPage)/3")
        }
        .padding(EdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 0))
    }
}

struct FormHeader_Previews: PreviewProvider {
    static var previews: some View {
        FormHeader(currentPage: 1, totalNumberOfPages: 3)
    }
}
