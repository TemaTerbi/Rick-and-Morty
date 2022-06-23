//
//  Test.swift
//  RIck-and-Morty
//
//  Created by Artem Solovev on 23.06.2022.
//

import SwiftUI

struct DetailScreen: View {
    let character: Character
    
    var body: some View {
        NavigationView {
            ZStack {
                Form {
                    Section(header: HeaderDetailInfo(character: character).foregroundColor(.black)) {
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                    Section {
                        Text("Test")
                    }
                }
            }
        }
        .navigationTitle(character.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}


struct HeaderDetailInfo: View {
    let character: Character
    
    var body: some View {
        VStack {
            URLImage(urlString: "https://rickandmortyapi.com/api/character/avatar/\(character.id).jpeg")
                .clipShape(Circle())
                .frame(width: 200, height: 200)
            Text(character.status)
                .foregroundColor(.secondary)
            Text(character.name)
                .fontWeight(.bold)
                .font(.system(size: 35))
            Text(character.species)
                .foregroundColor(.secondary)
        }
    }
}
