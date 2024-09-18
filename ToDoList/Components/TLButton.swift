//
//  TLButton.swift
//  ToDoList
//
//  Created by Mohit Khandal on 23/05/24.
//

import SwiftUI

struct TLButton: View {
    let title: String
    let backgroundColor :Color
    @Binding var showAlert: Bool
    @Binding var alertMessage: String
    let action: () -> Void
    var body: some View {
        Button(action: {
            action()
        }, label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10).foregroundColor(backgroundColor)
                Text(title).foregroundColor(Color.white).bold()
            }
        }).alert(isPresented: $showAlert, content: {
            Alert(title: Text("Alert"), message: Text(alertMessage), dismissButton: .default(Text("Okay")))
        })
    }
}

#Preview {
    TLButton(title: "Button", backgroundColor: .pink, showAlert: .constant(false), alertMessage: .constant("")) {
        // Action
    }
}
