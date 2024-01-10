//
//  Functions.swift
//  Pokedex
//
//  Created by Abdulloh on 09/01/24.
//

import Foundation

func sort(_ array: [Pokemon]?, byType type: String) -> [Pokemon] {
    var pokemons: [Pokemon] = []
    
    if let pokemon = array {
        for i in pokemon {
            for t in i.type {
                if t == type {
                    pokemons.append(i)
                }
            }
        }
        return pokemons
    } else {
        return []
    }
}
