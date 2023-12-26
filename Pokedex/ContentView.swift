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
        ZStack {
            Image("Pokemon")
                .resizable()
                .frame(width: 300, height: 300)
                .offset(x: UIScreen.main.bounds.size.width/4, y: -UIScreen.main.bounds.size.height/2.1)
                .opacity(0.35)
            
            LazyVGrid(
                columns: columns,
                content: {
                    ZStack {
                        Image("Pokemon")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .opacity(0.35)
                            .offset(x: 30, y: 30)
                        
                        VStack(alignment: .leading) {
                            Text("Hello")
                                .foregroundStyle(.white)
                                .font(.system(size: 22, weight: .semibold, design: .rounded))
                            
                            HStack {
                                VStack {
                                    Text("Type")
                                        .foregroundStyle(.white)
                                        .font(.system(size: 12, weight: .medium))
                                        .padding(5)
                                        .background(
                                            Capsule()
                                                .foregroundColor(Color.white.opacity(0.3))
                                    )
                                    Text("Type")
                                        .foregroundStyle(.white)
                                        .font(.system(size: 12, weight: .medium))
                                        .padding(5)
                                        .background(
                                            Capsule()
                                                .foregroundColor(Color.white.opacity(0.3))
                                    )
                                }
                                
                                Image("004")
                                
                            }
                        }
                    }
                    .padding()
                    .background(
                        Color.red.opacity(0.7)
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                }
            )
        }
        .navigationTitle("Pokedex")
    }
}

#Preview {
    NavigationStack {
        ContentView()
    }
}
