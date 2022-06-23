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
        Form {
            Section(header: HeaderDetailInfo(character: character).foregroundColor(.primary)) {
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
            Section(header: Text("Info")) {
                VStack(alignment: .leading) {
                    Text("Gender")
                        .fontWeight(.bold)
                        .font(.system(size: 15))
                    Text(character.gender)
                        .foregroundColor(.secondary)
                }
                VStack(alignment: .leading) {
                    Text("Origin")
                        .fontWeight(.bold)
                        .font(.system(size: 15))
                    Text(character.origin.name)
                        .foregroundColor(.secondary)
                }
                VStack(alignment: .leading) {
                    Text("Location")
                        .fontWeight(.bold)
                        .font(.system(size: 15))
                    Text(character.location.name)
                        .foregroundColor(.secondary)
                }
            }
        }
        .navigationTitle(character.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}
