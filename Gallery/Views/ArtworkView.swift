//
//  ArtworkView.swift
//  Gallery
//
//  Created by Florian Degraeve on 03/12/2025.
//

import SwiftUI

struct ArtworkView: View {
    @State var selectedArtwork : Artwork
    @Environment(GalleryDataStore.self) private var dataStore
    var body: some View {
        VStack{
            Text(selectedArtwork.title)
            Divider()
            Text(selectedArtwork.medium)
            Text(selectedArtwork.dimensions)
            Text(selectedArtwork.description)
            Divider()
            Text("Artist: " + dataStore.getArtist(artwork: selectedArtwork).name )
            Divider()
            Text("List of other art")
            List(dataStore.getArtworkInSameGallery(artwork: selectedArtwork), id: \.self) {artwork in
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
