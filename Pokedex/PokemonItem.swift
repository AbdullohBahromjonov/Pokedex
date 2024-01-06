//
//  PokemonItem.swift
//  Pokedex
//
//  Created by Abdulloh on 27/12/23.
//

import SwiftUI

struct PokemonItem: View {
    let number: String
    let name: String
    let type: [String]
    let img: String
    
    var body: some View {
        ZStack {
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text(name)
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ForEach(type, id: \.self) { t in
                        Text(t)
                            .font(.system(size: 12, weight: .bold))
                            .foregroundColor(.white)
                            .padding(.vertical, 5)
                            .padding(.horizontal, 7)
                            .background(
                                Capsule()
                                    .foregroundColor(Color(type[0]))
                            )
                    }
                    
                    Spacer()
                }
                
                Spacer()
            }
            
            HStack {
                Spacer()
                
                AsyncImage(
                    url: URL(string: img.replacingOccurrences(of: "http", with: "https")),
                    content: { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 100)
                            .offset(x: 12, y: 20)
                    },
                    placeholder: {
                        ProgressView()
                            .offset(x: -8, y: 28)
                    }
                )
            }
        }
        .padding()
        .background(
            ZStack {
                ZStack {
                    Color(type[0])
                    Color.black.opacity(0.2)
                }
                
                Image("Pokemon w")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .opacity(0.3)
                    .offset(x: 50, y: 30)
            }
        )
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .padding(4)
    }
}

#Preview {
    PokemonItem(
        number: "001",
        name: "Pikachu",
        type: ["Grass", "Water"],
        img: "http://www.serebii.net/pokemongo/pokemon/001.png"
    )
    .frame(width: 180, height: 100)
}
