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
                        Text(character.status)
                            .foregroundColor(.primary)
                            .fontWeight(.medium)
                    }
                    Text(character.name)
                        .lineLimit(1)
                        .foregroundColor(.primary)
                }
                .padding(10)
            }
            .padding(.bottom, 10)
        }
        .cornerRadius(10)
        .shadow(color: .secondary, radius: 3)
        .padding(5)
    }
}
