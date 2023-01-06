//
//  ContentView.swift
//  MeetUp
//
//  Created by Orlando Moraes Martins on 06/01/23.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.name),
        SortDescriptor(\.occupation)
    ]) var persons: FetchedResults<Person>
    
    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationView{
            List(persons){ person in
                NavigationLink{
                    PersonView(person: person)
                } label: {
                    HStack {
                        Text("👷🏼‍♀️")
                        
                        VStack(alignment: .leading){
                            Text(person.name ?? "Unknown Person")
                                .font(.headline)
                            
                            Text(person.occupation ?? "Unknown Occupation")
                                .foregroundColor(.secondary)
                        }
                    }
                }

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
