//
//  FirstPageNextButton.swift
//  Welf
//
//  Created by Clem on 18/06/2020.
//  Copyright © 2020 Clem. All rights reserved.
//

import SwiftUI

struct FirstPageNextButton: View {
    @EnvironmentObject private var nameService: SignUpNameService
    @State private var disableNextButton: Bool = true
    var goToNextPage: () -> ()
    
    var body: some View {
        let logInText = Text("Next")
            .foregroundColor(Color.white)
            .bold()
        
        return GenericButton(
            buttonDisplayView: logInText,
            backgroundColour: disableNextButton ? .secondary : .green
        ) { () in
            self.goToNextPage()
        }
        .disabled(disableNextButton)
        .onReceive(nameService.isFirstPageNextButtonDisabledPublisher) {
            self.disableNextButton = $0
        }
    }
}

struct FirstPageNextButton_Previews: PreviewProvider {
    static var previews: some View {
        FirstPageNextButton(goToNextPage: {}).environmentObject(SignUpNameService())
    }
}
