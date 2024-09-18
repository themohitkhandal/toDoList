//
//  LoginView.swift
//  ToDoList
//
//  Created by Mohit Khandal on 23/05/24.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewVM()
    
    var body: some View {
        NavigationView {
            VStack {
                //            Header
                HeaderView(title: "To Do List", subTitle: "Get things done", angle: 10, backgroundColor: Color.pink)
                //            Login form
                Form {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage).foregroundColor(.red)
                    }
                    TextField("Email", text: $viewModel.email).textFieldStyle(RoundedBorderTextFieldStyle()).padding(.top, 5)
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                        .autocorrectionDisabled()
                    SecureField("Password", text: $viewModel.password).textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    TLButton(title: "Log In", backgroundColor: .blue, showAlert: $viewModel.showAlert, alertMessage: $viewModel.alertMessage) {
                        //                        Perform login here
                        viewModel.login()
                    }.padding()
                }.offset(y: -100)
                //            Create account
                VStack {
                    Text("New around here ?")
                    NavigationLink("Create An Account", destination: RegisterView())
                }.padding(.bottom, 30)
                Spacer()
            }
            
        }
    }
}

#Preview {
    LoginView()
}
