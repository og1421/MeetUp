//
//  ContentView.swift
//  MeetUp
//
//  Created by Orlando Moraes Martins on 06/01/23.
//

import SwiftUI
import Foundation
import UIKit

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.name),
        SortDescriptor(\.occupation)
    ]) var persons: FetchedResults<Person>
    
    @State private var showingAddScreen = false
    @State private var image: Image?
    
    var body: some View {
        NavigationView{
            List(persons){ person in
                NavigationLink{
                    PersonView(person: person)
                } label: {
                    HStack {
                        let image = loadImage(named: "\(person.imageId).jpeg", from: FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!)
                        
                        if let uiImage = image {
                            Image(uiImage: uiImage)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 60)
                                
                        } else {
                            Text("No Image")
                        }
                                                
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
    
    func loadImage(named: String ,from directory: URL) -> UIImage? {
        let fileURL = directory.appendingPathComponent(named)
        return UIImage(contentsOfFile: fileURL.path)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
