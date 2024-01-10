//
//  DetailsInfoView.swift
//  Pokedex
//
//  Created by Abdulloh on 09/01/24.
//

import SwiftUI

struct DetailsInfoView: View {
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

#Preview {
    DetailsInfoView(placeholder: "Name", value: "Jhon")
}
