//
//  BackButton.swift
//  Welf
//
//  Created by Clem on 18/06/2020.
//  Copyright © 2020 Clem. All rights reserved.
//

import SwiftUI

struct BackButton: View {
    @EnvironmentObject private var signUpService: SignUpService
    
    var body: some View {
        return self.showBackButton() ?
            self.createButton() : nil
    }
    
    private func showBackButton() -> Bool {
        signUpService.currentPage > signUpService.firstPage &&
            signUpService.currentPage < signUpService.totalNumberOfPages
    }
    
    private func createButton() -> GenericButton<Text> {
        let logInText = Text("Back")
            .foregroundColor(Color.white)
            .bold()
        
        return GenericButton(
            buttonDisplayView: logInText,
            backgroundColour: .green
        ) { () in
            self.signUpService.goToPreviousPage()
        }
    }
}

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        BackButton().environmentObject(SignUpService())
    }
}
