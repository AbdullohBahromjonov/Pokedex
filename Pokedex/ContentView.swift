//
//  ContentView.swift
//  Pokedex
//
//  Created by Abdulloh on 26/12/23.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            TypesView()
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(ViewModel())
}
