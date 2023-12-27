//
//  PokemonItem.swift
//  Pokedex
//
//  Created by Abdulloh on 27/12/23.
//

import SwiftUI

struct PokemonItem: View {
    var body: some View {
        ZStack {
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("Pokemon")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundStyle(.black)
                    
                    Text("Pokemon")
                        .font(.system(size: 10, weight: .semibold))
                        .foregroundStyle(.black)
                        .padding(.vertical, 5)
                        .padding(.horizontal, 7)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.offWhite)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.gray, lineWidth: 2)
                                        .blur(radius: 2)
                                        .offset(x: 1, y: 1)
                                        .mask(RoundedRectangle(cornerRadius: 10).fill(LinearGradient(colors: [Color.black, Color.clear], startPoint: .topLeading, endPoint: .bottomTrailing)))
                                )
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.white, lineWidth: 2)
                                        .blur(radius: 2)
                                        .offset(x: -1, y: -1)
                                        .mask(RoundedRectangle(cornerRadius: 10).fill(LinearGradient(colors: [Color.black, Color.clear], startPoint: .topLeading, endPoint: .bottomTrailing)))
                                )
                        )
                    
                    Text("Pokemon")
                        .font(.system(size: 10, weight: .semibold))
                        .foregroundStyle(.black)
                        .padding(.vertical, 5)
                        .padding(.horizontal, 7)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.offWhite)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.gray, lineWidth: 2)
                                        .blur(radius: 2)
                                        .offset(x: 1, y: 1)
                                        .mask(RoundedRectangle(cornerRadius: 10).fill(LinearGradient(colors: [Color.black, Color.clear], startPoint: .topLeading, endPoint: .bottomTrailing)))
                                )
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.white, lineWidth: 2)
                                        .blur(radius: 2)
                                        .offset(x: -1, y: -1)
                                        .mask(RoundedRectangle(cornerRadius: 10).fill(LinearGradient(colors: [Color.black, Color.clear], startPoint: .topLeading, endPoint: .bottomTrailing)))
                                )
                        )
                    
                    Spacer()
                }
                
                Spacer()
            }
            
            HStack {
                Spacer()
                
                Image("004")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 80)
                    .offset(x: 15, y : 20)
            }
        }
        .padding()
        .background(
            ZStack {
                LinearGradient(colors: [Color.offWhite, Color.white], startPoint: .topLeading, endPoint: .bottomTrailing)
                
                Image("Pokemon")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .opacity(0.35)
                    .offset(x: 50, y: 30)
            }
        )
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 7, y: 7)
        .shadow(color: Color.white.opacity(0.7), radius: 5, x: -5, y: -5)
        .padding(4)
    }
}

#Preview {
    PokemonItem()
        .frame(width: 180, height: 100)
}
