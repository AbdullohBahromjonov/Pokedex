//
//  Pokemon.swift
//  Pokedex
//
//  Created by Abdulloh on 27/12/23.
//

import Foundation

struct Pokemons: Codable {
    let pokemon: [Pokemon]
}

// MARK: - Pokemon
struct Pokemon: Codable, Hashable {
    let id: Int
    let num, name: String
    let img: String
    let type: [String]
    let height, weight, candy: String
    let candyCount: Int?
    let egg: Egg
    let spawnChance, avgSpawns: Double
    let spawnTime: String
    let multipliers: [Double]?
    let weaknesses: [String]
    let nextEvolution, prevEvolution: [Evolution]?

    enum CodingKeys: String, CodingKey {
        case id, num, name, img, type, height, weight, candy
        case candyCount = "candy_count"
        case egg
        case spawnChance = "spawn_chance"
        case avgSpawns = "avg_spawns"
        case spawnTime = "spawn_time"
        case multipliers, weaknesses
        case nextEvolution = "next_evolution"
        case prevEvolution = "prev_evolution"
    }
}

enum Egg: String, Codable {
    case notInEggs = "Not in Eggs"
    case omanyteCandy = "Omanyte Candy"
    case the10KM = "10 km"
    case the2KM = "2 km"
    case the5KM = "5 km"
}

// MARK: - Evolution
struct Evolution: Codable, Hashable {
    let num, name: String
}
