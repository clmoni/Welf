//
//  FirstPageNextButton.swift
//  Welf
//
//  Created by Clem on 18/06/2020.
//  Copyright © 2020 Clem. All rights reserved.
//

import SwiftUI

struct FirstPageNextButton: View {
    @EnvironmentObject private var signUpService: SignUpService
    var goToNextPage: () -> ()
    
    var body: some View {
        let logInText = Text("Next")
            .foregroundColor(Color.white)
            .bold()
        
        return GenericButton(
            buttonDisplayView: logInText,
            backgroundColour: signUpService.disableFirstPageNextButton ? .secondary : .green
        ) { () in
            self.goToNextPage()
        }
        .disabled(signUpService.disableFirstPageNextButton)
        .onReceive(signUpService.isFirstPageNextButtonDisabledPublisher) {
            self.signUpService.disableFirstPageNextButton = $0 ?? true
        }
    }
}

struct FirstPageNextButton_Previews: PreviewProvider {
    static var previews: some View {
        FirstPageNextButton(goToNextPage: {}).environmentObject(SignUpService())
    }
}
