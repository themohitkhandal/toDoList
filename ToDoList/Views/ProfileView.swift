//
//  ProfileView.swift
//  ToDoList
//
//  Created by Mohit Khandal on 23/05/24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewVM()
    @State private var showAlert = false
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    profile(user: user)
                } else {
                    Text("Loading Profile...")
                }
                
            }
            .navigationTitle("Profile")
        }
        .onAppear(perform: {
            viewModel.fetchUser()
        })
    }
    
    @ViewBuilder
    func profile(user: Users) -> some View {
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color.blue)
            .frame(width: 100, height: 100)
            .padding()
        
        VStack(alignment: .leading) {
            HStack {
                Text("Name: ").bold()
                Text(user.name)
            }.padding()
            HStack {
                Text("Email: ").bold()
                Text(user.email)
            }.padding()
            HStack {
                Text("Member since: ").bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }.padding()
        }
    
        Button("Log out"){
            viewModel.logout()
        }.tint(.red).padding()
        Spacer()
    }
        
}

#Preview {
    ProfileView()
}
