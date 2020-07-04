//
// FirstStep.swift
// Welf
//
//  Created by Clem on 21/06/2020.
// Copyright © 2020 Clem. All rights reserved.
//

import SwiftUI

struct FirstStep: View {
    @EnvironmentObject private var nameService: SignUpNameService
    @State private var isValidFirstName: Bool = false
    @State private var isValidLastName: Bool = false
    
    var body: some View {
        VStack{
            GenericTextFieldWithValidation(
                text: self.$nameService.firstName,
                isValidEntry: self.$isValidFirstName,
                label: "First name",
                textContentType: .givenName,
                keyboardType: .namePhonePad
            ).onReceive(nameService.validateFirstNameEntryPublisher) {
                guard let validationMessage = $0 else {
                    return
                }
                self.isValidFirstName = !(validationMessage.count > 0)
            }
            
            GenericTextFieldWithValidation(
                text: self.$nameService.lastName,
                isValidEntry: self.$isValidLastName,
                label: "Last name",
                textContentType: .familyName,
                keyboardType: .namePhonePad
            ).onReceive(nameService.validateLastNameEntryPublisher) {
                guard let validationMessage = $0 else {
                    return
                }
                self.isValidLastName = !(validationMessage.count > 0)
            }
        }
        .transition(.move(edge: .leading))
    }
}

struct FirstStep_Previews: PreviewProvider {
    static var previews: some View {
        FirstStep().environmentObject(SignUpNameService())
    }
}
