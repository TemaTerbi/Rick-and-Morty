//
//  Character.swift
//  RIck-and-Morty
//
//  Created by deniss den on 22.06.2022.
//

import Foundation

struct Character: Hashable, Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
}
