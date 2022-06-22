//
//  UploadImage.swift
//  RIck-and-Morty
//
//  Created by deniss den on 22.06.2022.
//

import Foundation
import SwiftUI

struct URLImage: View {
    let urlString: String
    
    @State var data: Data?
    
    var body: some View {
        if let data = data, let uiimage = UIImage(data: data ) {
            Image(uiImage: uiimage)
                .resizable()
                .scaledToFit()
        } else {
            Image(systemName: "rectangle.slash.fill")
                .resizable()
                .scaledToFit()
                .onAppear {
                    fetchData()
                }
        }
    }
    
    private func fetchData() {
        guard let url = URL(string: urlString) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) {data, response, error in
            self.data = data
        }
        task.resume()
    }
}
