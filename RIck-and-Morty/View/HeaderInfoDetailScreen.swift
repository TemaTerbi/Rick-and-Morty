//

// HeaderInfoDetailScreen.swift
// RIck-and-Morty
//
// Created by AUTHOR on 23.06.2022.
// Copyright (c) 2020 Artem Solovev. All rights reserved.
//
//


import Foundation
import SwiftUI

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
