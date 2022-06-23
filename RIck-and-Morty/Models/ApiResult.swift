//
//  ApiResult.swift
//  RIck-and-Morty
//
//  Created by Artem Solovev on 22.06.2022.
//

import Foundation

struct ApiResult: Hashable, Codable{
    let results: [Character]
    let info: ApiInfo
}
