//
//  ContentView.swift
//  RIck-and-Morty
//
//  Created by deniss den on 22.06.2022.
//

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

struct ApiResult: Hashable, Codable{
    let results: [Character]
    let info: ApiInfo
}

struct ApiInfo: Hashable, Codable{
    let pages: Int
}

struct Character: Hashable, Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
}

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

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    private var gridLayout = [GridItem(.flexible(), spacing: 0),GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridLayout) {
                    ForEach((viewModel.character), id: \.self) { character in
                        ZStack {
                            Rectangle()
                                .foregroundColor(.white)
                            VStack(alignment: .leading) {
                                URLImage(urlString: "https://rickandmortyapi.com/api/character/avatar/\(character.id).jpeg")
                                VStack(alignment: .leading) {
                                    HStack {
                                        Image(systemName: "circlebadge.fill")
                                            .foregroundColor(character.status == "Alive" ? .green :                            character.status == "unknown" ? .yellow : .red)
                                        Text(character.status)
                                    }
                                    Text(character.name)
                                        .lineLimit(1)
                                }
                                .padding(10)
                            }
                            .padding(.bottom, 10)
                        }
                        .cornerRadius(10)
                        .shadow(radius: 3)
                        .padding(5)
                    }
                }
                .padding(10)
            }
            .navigationTitle("Characters")
        }
        .onAppear {
            viewModel.fetch()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View {
    public func addBorder<S>(_ content: S, width: CGFloat = 1, cornerRadius: CGFloat) -> some View where S : ShapeStyle {
        let roundedRect = RoundedRectangle(cornerRadius: cornerRadius)
        return clipShape(roundedRect)
             .overlay(roundedRect.strokeBorder(content, lineWidth: width))
    }
}
