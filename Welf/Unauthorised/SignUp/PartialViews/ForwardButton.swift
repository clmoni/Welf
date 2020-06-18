//
//  ForwardButton.swift
//  Welf
//
//  Created by Clement Oniovosa on 18/06/2020.
//  Copyright © 2020 Clement Oniovosa. All rights reserved.
//

import SwiftUI

struct ForwardButton: View {
    @ObservedObject var signUpViewModel: SignUpViewModel
    var goToNextPage: () -> ()
    
    var body: some View {
        VStack {
            if signUpViewModel.currentPage == signUpViewModel.firstPage {
                FirstPageNextButton(signUpViewModel: self.signUpViewModel, goToNextPage: self.goToNextPage)
            }
            else if signUpViewModel.currentPage == 2 {
                SecondPageNextButton(signUpViewModel: self.signUpViewModel, goToNextPage: self.goToNextPage)
            }
            else {
                SignUpButton(signUpViewModel: self.signUpViewModel, goToNextPage: self.goToNextPage)
            }
        }
    }
}

struct ForwardButton_Previews: PreviewProvider {
    static var previews: some View {
        ForwardButton(signUpViewModel: .init(), goToNextPage: {})
    }
}
