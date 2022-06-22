//
//  ViewModel.swift
//  RIck-and-Morty
//
//  Created by deniss den on 22.06.2022.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    @Published var character: [Character] = []
    
    func fetch(page: Int = 1) {
        guard let url = URL(string:"https://rickandmortyapi.com/api/character?page=\(page)") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) {[weak self] data, response, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let apiResult = try JSONDecoder().decode(ApiResult.self, from: data)
                DispatchQueue.main.async {
                    self?.character.append(contentsOf: apiResult.results)
                }
                
                if apiResult.info.pages > page {
                    self?.fetch(page: page + 1)
                }
            }
            catch {
                print(error)
            }
            
        }
        task.resume()
    }
}
