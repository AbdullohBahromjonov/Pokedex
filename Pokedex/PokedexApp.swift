//
//  PokedexApp.swift
//  Pokedex
//
//  Created by Abdulloh on 26/12/23.
//

import SwiftUI

@main
struct PokedexApp: App {
    var viewModel = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(.dark)
                .environmentObject(viewModel)
        }
    }
}
