//
//  PokemonDetailsView.swift
//  Pokedex
//
//  Created by Abdulloh on 27/12/23.
//

import SwiftUI

struct PokemonDetailsView: View {
    @Environment(\.dismiss) var dismiss
    let pokemon: Pokemon
    
    var body: some View {
        ZStack(alignment: .top) {
            Color(pokemon.type[0])
                .ignoresSafeArea()
                .frame(height: UIScreen.main.bounds.size.height/2)
                .overlay {
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
                    
                    AsyncImage(
                        url: URL(string: pokemon.img.replacingOccurrences(of: "http", with: "https")),
                        content: { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 300)
                        },
                        placeholder: {
                            ProgressView()
                                .frame(height: 300)
                        }
                    )
                    .zIndex(1)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Details")
                            .font(.system(size: 20, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top)
                        
                        DetailView(placeholder: "Height", value: pokemon.height)
                        DetailView(placeholder: "Weight", value: pokemon.weight)
                        DetailView(placeholder: "Egg", value: pokemon.egg.rawValue)
                        
                        Text("Candy")
                            .font(.system(size: 20, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top)
                        
                        DetailView(placeholder: "Candy", value: pokemon.candy)
                        DetailView(placeholder: "Candy count", value:String(pokemon.candyCount ?? 0))
                        
                        Text("Weaknesses")
                            .font(.system(size: 20, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top)
                        
                        FlexibleView(
                            data: pokemon.weaknesses,
                            spacing: 5,
                            alignment: .leading) { weakness in
                                Text(weakness)
                                    .foregroundColor(.gray)
                                    .font(.system(size: 16))
                                    .padding(5)
                                    .background(.white.opacity(0.15))
                                    .cornerRadius(7)
                            }
                        
                        Text("Spawn")
                            .font(.system(size: 20, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top)
                        
                        DetailView(placeholder: "Spawn chances", value: String(pokemon.spawnChance))
                        DetailView(placeholder: "Avarege spawn", value: String(pokemon.avgSpawns))
                        DetailView(placeholder: "Spawn time", value: String(pokemon.spawnTime))
                        
                        Text("Evolution")
                            .font(.system(size: 20, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top)
                        
                        if let nextEvolution = pokemon.nextEvolution {
                            ForEach(nextEvolution, id: \.num) { evolution in
                                DetailView(placeholder: "Evolution #\(evolution.num)", value: evolution.name)
                            }
                        }
                        
                        if let prevEvolution = pokemon.prevEvolution {
                            ForEach(prevEvolution, id: \.num) { evolution in
                                DetailView(placeholder: "Evolution #\(evolution.num)", value: evolution.name)
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
                        dismiss()
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
    NavigationStack {
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

struct DetailView: View {
    let placeholder: String
    let value: String
    
    var body: some View {
        HStack {
            Text("\(placeholder):")
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.gray)
            
            Spacer()
            
            Text(value)
                .font(.system(size: 16, weight: .semibold))
        }
    }
}

struct FlexibleView<Data: Collection, Content: View>: View where Data.Element: Hashable {
    let availableWidth: CGFloat = UIScreen.main.bounds.size.width
    let data: Data
    let spacing: CGFloat
    let alignment: HorizontalAlignment
    let content: (Data.Element) -> Content
    @State var elementsSize: [Data.Element: CGSize] = [:]
    
    var body : some View {
        VStack(alignment: alignment, spacing: spacing) {
            ForEach(computeRows(), id: \.self) { rowElements in
                HStack(spacing: spacing) {
                    ForEach(rowElements, id: \.self) { element in
                        content(element)
                            .fixedSize()
                            .readSize { size in
                                elementsSize[element] = size
                            }
                    }
                }
            }
        }
    }
    
    func computeRows() -> [[Data.Element]] {
        var rows: [[Data.Element]] = [[]]
        var currentRow = 0
        var remainingWidth = availableWidth

        for element in data {
          let elementSize = elementsSize[element, default: CGSize(width: availableWidth, height: 1)]

          if remainingWidth - elementSize.width >= 0 {
            rows[currentRow].append(element)
          } else {
            currentRow = currentRow + 1
            rows.append([element])
            remainingWidth = availableWidth
          }

          remainingWidth = remainingWidth - elementSize.width
        }

        return rows
      }
}

extension View {
    func readSize(onChange: @escaping (CGSize) -> Void) -> some View {
        background(
            GeometryReader { geometryProxy in
                Color.clear
                    .preference(key: SizePreferenceKey.self, value: geometryProxy.size)
            }
        )
        .onPreferenceChange(SizePreferenceKey.self, perform: onChange)
    }
    
    func blockBackground(alignment: Alignment) -> some View {
        modifier(BlockBackground(alignment: alignment))
    }
    
    func title() -> some View {
        modifier(TitleText())
    }
}

private struct SizePreferenceKey: PreferenceKey {
  static var defaultValue: CGSize = .zero
  static func reduce(value: inout CGSize, nextValue: () -> CGSize) {}
}

private struct BlockBackground: ViewModifier {
    let alignment: Alignment
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, alignment: alignment)
            .padding()
            .background(Color.white)
            .cornerRadius(12)
    }
}

private struct TitleText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 22, weight: .medium))
    }
}
