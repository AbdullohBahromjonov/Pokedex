//
//  ImageView.swift
//  Pokedex
//
//  Created by Abdulloh on 09/01/24.
//

import SwiftUI

struct ImageView: View {
    @ObservedObject var imageLoader:ImageLoader
    @State var image:UIImage = UIImage()

    init(withURL url:String) {
        imageLoader = ImageLoader(urlString:url)
    }
    
    var body: some View {
        Image(uiImage: image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .onReceive(imageLoader.didChange) { data in
                self.image = UIImage(data: data) ?? UIImage()
            }
    }
}

#Preview {
    ImageView(withURL: "https://www.serebii.net/pokemongo/pokemon/001.png")
}
