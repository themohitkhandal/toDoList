//
//  RegisterView.swift
//  ToDoList
//
//  Created by Mohit Khandal on 23/05/24.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var viewModel = RegisterViewVM()

    
    var body: some View {
        VStack {
            //            Header
            HeaderView(title: "Register", subTitle: "Start organizing todos", angle: -10, backgroundColor: .orange)
            //            Login form
                Form {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage).foregroundColor(.red)
                    }
                    TextField("Name", text: $viewModel.name).textFieldStyle(RoundedBorderTextFieldStyle()).padding(.top, 5)
                        .autocorrectionDisabled()
                    TextField("Email", text: $viewModel.email).textFieldStyle(RoundedBorderTextFieldStyle()).autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                        .autocorrectionDisabled()
                    SecureField("Password", text: $viewModel.password).textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    TLButton(title: "Register", backgroundColor: .green, showAlert: $viewModel.showAlert, alertMessage: $viewModel.alertMessage){
                        viewModel.register()
                    }.padding()
                }.offset(y : -100)
                
            
            //            Create account
//            Spacer()
        }
    }
}

#Preview {
    RegisterView()
}
