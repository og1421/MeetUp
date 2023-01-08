//
//  PersonView.swift
//  MeetUp
//
//  Created by Orlando Moraes Martins on 06/01/23.
//

import SwiftUI

struct PersonView: View {
    let person: Person
    
    var body: some View {
        NavigationView{
            VStack{
                let image = loadImage(named: "\(person.imageId).jpeg", from: FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!)
                
                if let uiImage = image {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFit()
                    
                } else {
                    Text("No Image")
                }

                Form {
                    Section {
                        VStack(alignment: .leading) {
                            Text("**Name:** \(person.name ?? "Unknown") \(person.lastName ?? "Unknown")")
                            Text("**Ocupação:** \(person.occupation ?? "Unknown")")
                        }
                        
                        VStack(alignment: .leading) {
                            Text("**First Meet:** \(person.whereMeet ?? "Unknonw")")
                        }
                    }
                }
            }
        }
    }
    
    func loadImage(named: String ,from directory: URL) -> UIImage? {
        let fileURL = directory.appendingPathComponent(named)
        return UIImage(contentsOfFile: fileURL.path)
    }

}

//struct PersonView_Previews: PreviewProvider {
//    static var previews: some View {
//        PersonView()
//    }
//}
