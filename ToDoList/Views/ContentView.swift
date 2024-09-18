//
//  ContentView.swift
//  ToDoList
//
//  Created by Mohit Khandal on 20/05/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewVM()
    
    
    
    var body: some View {
        
        if viewModel.isSignedIn, !viewModel.currentUserID.isEmpty {
            accountView
        } else {
            LoginView()
        }
    }
    
    @ViewBuilder
    var accountView: some View {
        TabView {
            ToDoListView(userId: viewModel.currentUserID)
                .tabItem{
                    Label("Home", systemImage: "house")
                }
            ProfileView()
                .tabItem{
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}

struct ContentView_Preview: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

