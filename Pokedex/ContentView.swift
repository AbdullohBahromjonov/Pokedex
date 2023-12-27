//
//  ContentView.swift
//  Pokedex
//
//  Created by Abdulloh on 26/12/23.
//

import SwiftUI

struct ContentView: View {
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.offWhite
                    .ignoresSafeArea()
                
                Image("Pokemon")
                    .resizable()
                    .frame(width: 300, height: 300)
                    .offset(x: UIScreen.main.bounds.size.width/4, y: -UIScreen.main.bounds.size.height/2.1)
                    .opacity(0.35)
                
                ScrollView(showsIndicators: false) {
                    LazyVGrid(
                        columns: columns,
                        content: {
                            ForEach(1...24, id: \.self) {_ in
                                PokemonItem()
                            }
                        }
                    )
                    .padding(.horizontal)
                    .padding(.top)
                }
            }
            .navigationTitle("Pokedex")
        }
    }
}

#Preview {
    NavigationStack {
        ContentView()
    }
}

extension Color {
    static let offWhite = Color(red: 225 / 255, green: 225 / 255, blue: 235 / 255)
}
