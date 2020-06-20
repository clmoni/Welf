//
//  BackButton.swift
//  Welf
//
//  Created by Clem on 18/06/2020.
//  Copyright © 2020 Clem. All rights reserved.
//

import SwiftUI

struct BackButton: View {
    @ObservedObject var signUpViewModel: SignUpViewModel
    var goToPreviousPage: () -> ()
    
    var body: some View {
        return signUpViewModel.currentPage > signUpViewModel.firstPage ?
            self.createButton() : nil
    }
    
    private func createButton() -> GenericButton<Text> {
        let logInText = Text("Back")
            .foregroundColor(Color.white)
            .bold()
        
        return GenericButton(
            buttonDisplayView: logInText,
            backgroundColour: .green
        ) { () in
            self.goToPreviousPage()
        }
    }
}

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        BackButton(signUpViewModel: .init(), goToPreviousPage: {})
    }
}
