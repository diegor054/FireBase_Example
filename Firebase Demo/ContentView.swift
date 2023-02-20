//
//  ContentView.swift
//  Firebase Demo
//
//  Created by Diego Rivera on 2/18/23.
//


import SwiftUI
import Firebase

struct ContentView: View {
    
    @ObservedObject var model = ViewModel()
    
    @State var name = ""
    @State var notes = ""
    
    var body: some View {
        VStack {
            List (model.list) { item in
                HStack {
                    Text(item.name)
                    Spacer()
                    Text(item.notes)
                    Spacer()
                
                    // Delete button
                    Button(action: {
                        
                        // Delete item
                        model.deleteData(todoToDelete: item)
                    }, label: {
                        Image(systemName: "minus.circle")
                    })
                    .buttonStyle(BorderlessButtonStyle())
                    
                }
            }
            
            Divider()
            
            VStack(spacing: 5) {
                
                TextField("Name:", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("Notes:", text: $notes)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: {
                    
                    //add data
                    model.addData(name: name, notes: notes)
                
                    name = ""
                    notes = ""
                    
                }, label: {
                    Text("Add Todo Item")
                })
            }
            .padding()
        }
    }
    
    init() {
        model.getData()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
