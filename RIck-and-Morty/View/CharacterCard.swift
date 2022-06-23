//
//  CharacterCard.swift
//  RIck-and-Morty
//
//  Created by Artem Solovev on 23.06.2022.
//

import Foundation
import SwiftUI

struct CardView: View {
    let character: Character
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.primary)
                .colorInvert()
            VStack(alignment: .leading) {
                URLImage(urlString: "https://rickandmortyapi.com/api/character/avatar/\(character.id).jpeg")
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "circlebadge.fill")
                            .foregroundColor(character.status == "Alive" ? .green :
                                             character.status == "unknown" ? .yellow : .red)
                        HStack {
                            Text(character.status + "  -")
                            Text(character.species)
                        }
                        .foregroundColor(.secondary)
                        .font(.system(size: 10))
                    }
                    Text(character.name)
                        .foregroundColor(.primary)
                        .fontWeight(.bold)
                        .lineLimit(1)
                }
                .padding(10)
            }
            .padding(.bottom, 10)
        }
        .cornerRadius(10)
        .shadow(color: .secondary, radius: 5)
        .padding(5)
    }
}
