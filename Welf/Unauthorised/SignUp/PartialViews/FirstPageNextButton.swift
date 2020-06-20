//
//  FirstPageNextButton.swift
//  Welf
//
//  Created by Clement Oniovosa on 18/06/2020.
//  Copyright © 2020 Clement Oniovosa. All rights reserved.
//

import SwiftUI

struct FirstPageNextButton: View {
    @ObservedObject var signUpViewModel: SignUpViewModel
    var goToNextPage: () -> ()
    
    var body: some View {
        let logInText = Text("Next")
            .foregroundColor(Color.white)
            .bold()
        
        return GenericButton(
            buttonDisplayView: logInText,
            backgroundColour: signUpViewModel.disableFirstPageNextButton ? .secondary : .green
        ) { () in
            self.goToNextPage()
        }
        .disabled(signUpViewModel.disableFirstPageNextButton)
        .onReceive(signUpViewModel.isFirstPageNextButtonDisabledPublisher) {
            self.signUpViewModel.disableFirstPageNextButton = $0 ?? true
        }
    }
}

struct FirstPageNextButton_Previews: PreviewProvider {
    static var previews: some View {
        FirstPageNextButton(signUpViewModel: .init(), goToNextPage: {})
    }
}
