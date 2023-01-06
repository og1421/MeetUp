//
//  AddPersonView.swift
//  MeetUp
//
//  Created by Orlando Moraes Martins on 06/01/23.
//

import CoreImage
import SwiftUI

struct AddPersonView: View {
    @State private var image: Image?
    
    @State private var name = ""
    @State private var lastName = ""
    @State private var genre = ""
    @State private var whereMeet = ""
    @State private var occupation = ""
    
    @State private var showingImagePicker = false
    
    let genres = ["Male", "Female"]
    
    var body: some View {
        NavigationView {
            VStack{
                ZStack {
                    Rectangle()
                        .fill(.secondary)
                    
                    Text("Tap to select a picture")
                        .foregroundColor(.white)
                        .font(.headline)
                    
                    image?
                        .resizable()
                        .scaledToFit()
                }
                .onTapGesture {
                    showingImagePicker = true
                }
                
                Form {
                    Section{
                        TextField("Name", text: $name)
                        TextField("Last Name", text: $lastName)
                    }
                    
                    Section{
                        Picker("Genre", selection: $genre){
                            ForEach(genres, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(.segmented)
                    } header: {
                        Text("Genre")
                    }
                    
                    Section {
                        TextField("Occupation", text: $occupation)
                        TextField("Where meet", text: $whereMeet)
                    }
                    
                }
                .navigationTitle("Add person")
                .toolbar{
                    ToolbarItem(placement: .navigationBarLeading){
                        Button("Cancel"){
                            //dismiss the view
                        }
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Save"){
                            //Sava in Core Data
                        }
                    }
                }
            }
        }
    }
}

struct AddPersonView_Previews: PreviewProvider {
    static var previews: some View {
        AddPersonView()
    }
}
