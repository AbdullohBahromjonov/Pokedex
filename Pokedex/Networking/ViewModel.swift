//
//  ViewModel.swift
//  Pokedex
//
//  Created by Abdulloh on 27/12/23.
//

import SwiftUI

class ViewModel: ObservableObject {
    @Published var pokemons: Pokemons? = nil
    
    func getPokemons() {
        guard let url = URL(string: "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json") else { fatalError("Missing URL") }
        
        let urlRequest = URLRequest(url: url)

        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }

            guard let response = response as? HTTPURLResponse else { return }

            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let decodedData = try JSONDecoder().decode(Pokemons.self, from: data)
                        self.pokemons = decodedData
                    } catch let error {
                        print("Error decoding: ", error.localizedDescription)
                    }
                }
            }
        }

        task.resume()
    }
}
