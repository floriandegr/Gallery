//
//  ArtistView.swift
//  Gallery
//
//  Created by Florian Degraeve on 03/12/2025.
//

import SwiftUI

struct ArtistView: View {
    var selectedArtist : Artist
    var body: some View {
        VStack{
            Text(selectedArtist.name)
            Divider()
            Text(selectedArtist.nationality)
            Text(selectedArtist.style)
            Text(selectedArtist.description)
            Divider()
            Text("List of Art")
            List(selectedArtist.artworks, id: \.self) {artwork in
                NavigationLink(value: Route.Artwork(artwork)) {
                    VStack{
                        Text(artwork.title)
                        Text(artwork.description)
                    }
                }
                
            }
        }
    }
}
