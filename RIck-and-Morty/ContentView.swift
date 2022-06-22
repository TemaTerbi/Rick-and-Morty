//
//  ContentView.swift
//  RIck-and-Morty
//
//  Created by deniss den on 22.06.2022.
//

import SwiftUI

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
