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

//struct PersonView_Previews: PreviewProvider {
//    static var previews: some View {
//        PersonView()
//    }
//}
