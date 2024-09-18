//
//  NewItemView.swift
//  ToDoList
//
//  Created by Mohit Khandal on 23/05/24.
//

import SwiftUI

struct NewItemView: View {
    
    @StateObject var viewModel = NewItemViewVM()
    @Binding var newItemPresented: Bool
    var body: some View {
        VStack {
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 50)
            
            Form {
//                text field
                TextField("Title", text: $viewModel.title)
                
//                Due date picker
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                TLButton(title: "Save", backgroundColor: .pink, showAlert: $viewModel.showAlert, alertMessage: $viewModel.alertMessage){
                    if viewModel.canSave{
                        viewModel.save()
                        newItemPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                    
                }.padding()
            }.alert(isPresented: $viewModel.showAlert, content: {
                Alert(title: Text("Error"), message: Text("Please fill in all fields and select due data that is today or newer."))
            })
        }
    }
}

#Preview {
    NewItemView(newItemPresented: Binding(get: {return true}, set: {
        _ in
    }))
}
