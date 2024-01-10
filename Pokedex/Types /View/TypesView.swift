//
//  TypesView.swift
//  Pokedex
//
//  Created by Abdulloh on 09/01/24.
//

import SwiftUI

struct TypesView: View {
    @EnvironmentObject var viewModel: ViewModel
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @State var types = [
        "Water",
        "Steel",
        "Rock",
        "Psychic",
        "Poison",
        "Normal",
        "Ice",
        "Ground",
        "Grass",
        "Ghost",
        "Flying",
        "Fire",
        "Fighting",
        "Fairy",
        "Electric",
        "Dragon",
        "Dark",
        "Bug"
    ]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(
                columns: columns,
                content: {
                    ForEach(types, id: \.self) { type in
                        NavigationLink {
                            PokemonsView(pokemons: sort(viewModel.pokemons?.pokemon, byType: type), type: type)
                        } label: {
                            Text(type)
                                .foregroundColor(.white)
                                .font(.system(size: 20, weight: .semibold))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .frame(height: 40)
                                .padding()
                                .background(
                                    ZStack {
                                        ZStack {
                                            Color(type)
                                            Color.black.opacity(0.2)
                                        }
                                        
                                        Image("Pokemon w")
                                            .resizable()
                                            .frame(width: 100, height: 100)
                                            .opacity(0.3)
                                            .offset(x: 50, y: 30)
                                        
                                        Circle()
                                            .foregroundColor(.white)
                                            .frame(width: 100, height: 100)
                                            .opacity(0.3)
                                            .offset(x: -80, y: -60)
                                    }
                                )
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                        }
                    }
                }
            )
            .padding()
        }
        .navigationTitle("Pokedex")
        .onAppear {
            viewModel.getPokemons()
        }
    }
}


#Preview {
    TypesView()
}
