//
//  PokemonsView.swift
//  Pokedex
//
//  Created by Abdulloh on 02/01/24.
//

import SwiftUI

struct PokemonsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var viewModel: ViewModel
    
    let pokemons: [Pokemon]
    let type: String
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(
                columns: columns,
                content: {
                    ForEach(pokemons, id: \.id) { pokemon in
                        NavigationLink {
                            PokemonDetailsView(pokemon: pokemon)
                        } label: {
                            PokemonItem(
                                number: pokemon.num,
                                name: pokemon.name,
                                type: pokemon.type,
                                img: pokemon.img
                            )
                        }

                    }
                }
            )
            .padding(.horizontal)
            .padding(.top)
        }
        .navigationTitle(type)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            leading:
                Button(
                    action: {
                        self.presentationMode.wrappedValue.dismiss()
                    },
                    label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .bold))
                    }
                )
        )
    }
}

#Preview {
    PokemonsView(
        pokemons: [
            Pokemon(
                id: 1,
                num: "#001",
                name: "Bulbasaur",
                img: "https://www.serebii.net/pokemongo/pokemon/001.png",
                type: ["Water"],
                height: "0.23 m",
                weight: "2.3 kg",
                candy: "No eggs",
                candyCount: 21,
                egg: Egg.notInEggs,
                spawnChance: 0.24,
                avgSpawns: 2.34,
                spawnTime: "12:00",
                multipliers: [2.32],
                weaknesses: ["Poison"],
                nextEvolution: [Evolution(num: "1", name: "Bulbarium")],
                prevEvolution: [Evolution(num: "1", name: "Bulbarium")]
            ),
            Pokemon(
                id: 2,
                num: "#001",
                name: "Bulbasaur",
                img: "https://www.serebii.net/pokemongo/pokemon/002.png",
                type: ["Water"],
                height: "0.23 m",
                weight: "2.3 kg",
                candy: "No eggs",
                candyCount: 21,
                egg: Egg.notInEggs,
                spawnChance: 0.24,
                avgSpawns: 2.34,
                spawnTime: "12:00",
                multipliers: [2.32],
                weaknesses: ["Poison"],
                nextEvolution: [Evolution(num: "1", name: "Bulbarium")],
                prevEvolution: [Evolution(num: "1", name: "Bulbarium")]
            ),
            Pokemon(
                id: 3,
                num: "#001",
                name: "Bulbasaur",
                img: "https://www.serebii.net/pokemongo/pokemon/003.png",
                type: ["Water"],
                height: "0.23 m",
                weight: "2.3 kg",
                candy: "No eggs",
                candyCount: 21,
                egg: Egg.notInEggs,
                spawnChance: 0.24,
                avgSpawns: 2.34,
                spawnTime: "12:00",
                multipliers: [2.32],
                weaknesses: ["Poison"],
                nextEvolution: [Evolution(num: "1", name: "Bulbarium")],
                prevEvolution: [Evolution(num: "1", name: "Bulbarium")]
            )
        ],
        type: "Water"
    )
    .environmentObject(ViewModel())
}
