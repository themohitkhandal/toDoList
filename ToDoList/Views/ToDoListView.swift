//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Mohit Khandal on 23/05/24.
//
import FirebaseFirestoreSwift
import SwiftUI


struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewVM
    @FirestoreQuery var items: [ToDoListItem]
    
    
    
    init (userId: String) {
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: ToDoListViewVM(userId: userId))
    }
    
   
    
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    ToDoListItemView(item: item)
                        .swipeActions{
                            Button{
                                viewModel.delete(id: item.id)
                            } label: {
                                Text("Delete")
                            }.tint(.red)
                        }
                }.listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button{
//                    Action
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
            .onAppear {
                print("Items array", items)
            }
        }
    }
}

#Preview {
    ToDoListView(userId: "oi0XVXVJIKWAXNQyYYrox3Nbntw1")
}
