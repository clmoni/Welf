//
//  PageControl.swift
//  Welf
//
//  Created by Clem on 17/06/2020.
//  Copyright © 2020 Clem. All rights reserved.
//

import SwiftUI

struct PageControl: UIViewRepresentable {
    var currentPage: Int = 0
    var totalNumberOfPages: Int = 1
    
    func makeUIView(context: UIViewRepresentableContext<PageControl>) -> UIPageControl {
        let page = UIPageControl()
        page.currentPageIndicatorTintColor = .systemGreen
        page.numberOfPages = self.totalNumberOfPages
        page.pageIndicatorTintColor = .systemGray2
        
        return page
    }
    
    func updateUIView(_ uiView: PageControl.UIViewType, context: UIViewRepresentableContext<PageControl>) {
        uiView.currentPage = self.currentPage
    }
}

struct PageControl_Previews: PreviewProvider {
    static var previews: some View {
        PageControl()
    }
}
