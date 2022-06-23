//
//  Character.swift
//  RIck-and-Morty
//
//  Created by Artem Solovev on 22.06.2022.
//

import Foundation

struct Character: Hashable, Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let gender: String
    let origin: UrlItem
    let location: UrlItem
}
