//
//  ContentView.swift
//  RIck-and-Morty
//
//  Created by Artem Solovev on 22.06.2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    @State var selection: Int? = nil
    @State private var searchText = ""
    
    var searchResults: [Character] {
            if searchText.isEmpty {
                return viewModel.character
            } else {
                return viewModel.character.filter{ $0.name.contains(searchText) }
            }
        }
    
    private var gridLayout = [GridItem(.flexible(), spacing: 5),GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridLayout) {
                    ForEach((searchResults), id: \.self) { character in
                        NavigationLink(destination: DetailScreen(character: character)) {
                            CardView(character: character)
                        }
                    }
                }
                .navigationTitle("Characters")
                .searchable(text: $searchText)
                .padding(10)
            }
            .onAppear {
                viewModel.fetch()
            }
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

