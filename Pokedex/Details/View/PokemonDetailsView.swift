//
//  PokemonDetailsView.swift
//  Pokedex
//
//  Created by Abdulloh on 27/12/23.
//

import SwiftUI

struct PokemonDetailsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    let pokemon: Pokemon
    
    var body: some View {
        ZStack(alignment: .top) {
            ZStack {
                VStack {
                    Color(pokemon.type[0])
                        .ignoresSafeArea()
                        .frame(height: UIScreen.main.bounds.size.height/2)
                    Spacer()
                }
                
                ZStack {
                    Image("Pokemon w")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .opacity(0.2)
                        .offset(x: UIScreen.main.bounds.size.width/3)
                    
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(.white)
                        .frame(width: 200, height: 200)
                        .opacity(0.2)
                        .rotationEffect(Angle(degrees: -15))
                        .offset(x: -UIScreen.main.bounds.size.width/3, y: -UIScreen.main.bounds.size.height/2.2)
                    
                    Color.black.opacity(0.05)
                        .ignoresSafeArea()
                }
            }
            
            ScrollView(showsIndicators: false) {
                VStack() {
                    HStack {
                        ForEach(pokemon.type, id: \.self) { type in
                            Text(type)
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(.white)
                                .padding(.vertical, 5)
                                .padding(.horizontal, 9)
                                .background(
                                    Capsule()
                                        .foregroundColor(Color(pokemon.type[0]))
                                )
                        }
                        
                        Spacer()
                        
                        Text("#\(pokemon.num)")
                            .font(.system(size: 25, weight: .heavy))
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal)
                    
                    ImageView(withURL: pokemon.img.replacingOccurrences(of: "http", with: "https"))
                        .frame(height: 300)
                        .zIndex(1)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Details")
                            .font(.system(size: 20, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top)
                        
                        DetailsInfoView(placeholder: "Height", value: pokemon.height)
                        DetailsInfoView(placeholder: "Weight", value: pokemon.weight)
                        DetailsInfoView(placeholder: "Egg", value: pokemon.egg.rawValue)
                        
                        Text("Candy")
                            .font(.system(size: 20, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top)
                        
                        DetailsInfoView(placeholder: "Candy", value: pokemon.candy)
                        DetailsInfoView(placeholder: "Candy count", value:String(pokemon.candyCount ?? 0))
                        
                        Text("Weaknesses")
                            .font(.system(size: 20, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top)
                        
                        FlexibleView(
                            data: pokemon.weaknesses,
                            spacing: 5,
                            alignment: .leading) { weakness in
                                ZStack {
                                    Color.white.opacity(0.15)
                                        .clipShape(.capsule)
                                    
                                    Text(weakness)
                                        .foregroundColor(.gray)
                                        .font(.system(size: 16))
                                        .cornerRadius(7)
                                        .padding(5)
                                        .padding(.horizontal, 5)
                                }
                            }
                        
                        Text("Spawn")
                            .font(.system(size: 20, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top)
                        
                        DetailsInfoView(placeholder: "Spawn chances", value: String(pokemon.spawnChance))
                        DetailsInfoView(placeholder: "Avarege spawn", value: String(pokemon.avgSpawns))
                        DetailsInfoView(placeholder: "Spawn time", value: String(pokemon.spawnTime))
                        
                        Text("Evolution")
                            .font(.system(size: 20, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top)
                        
                        if let nextEvolution = pokemon.nextEvolution {
                            ForEach(nextEvolution, id: \.num) { evolution in
                                DetailsInfoView(placeholder: "Evolution #\(evolution.num)", value: evolution.name)
                            }
                        }
                        
                        if let prevEvolution = pokemon.prevEvolution {
                            ForEach(prevEvolution, id: \.num) { evolution in
                                DetailsInfoView(placeholder: "Evolution #\(evolution.num)", value: evolution.name)
                            }
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundColor(.black)
                    )
                    .padding(.top, -60)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationTitle(pokemon.name)
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
    NavigationView {
        PokemonDetailsView(
            pokemon: Pokemon(
                id: 1,
                num: "001",
                name: "Bulbarus",
                img: "http://www.serebii.net/pokemongo/pokemon/001.png",
                type: ["Grass", "Poison"],
                height: "0.56 m",
                weight: "3.4 kg",
                candy: "Bulbasaur Candy",
                candyCount: 25,
                egg: Egg.the2KM,
                spawnChance: 0.69,
                avgSpawns: 69,
                spawnTime: "20:00",
                multipliers: [1.58],
                weaknesses: [
                    "Fire",
                    "Ice",
                    "Flying",
                    "Psychic"
                ],
                nextEvolution: [
                    Evolution(num: "002", name: "Ivysaur"),
                    Evolution(num: "003", name: "Venusaur")
                ],
                prevEvolution: nil
            )
        )
    }
}
