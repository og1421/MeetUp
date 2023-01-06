//
//  ContentView.swift
//  MeetUp
//
//  Created by Orlando Moraes Martins on 06/01/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationView{
            List{
                Text("Item 1")
            }
            .navigationTitle("Meetup")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing){
                    Button{
                        showingAddScreen.toggle()
                    } label: {
                        Label("Add person", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddScreen){
                AddPersonView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
