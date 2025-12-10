//
//  GalleryDetailView.swift
//  Gallery
//
//  Created by Florian Degraeve on 03/12/2025.
//

import SwiftUI

struct GalleryDetailView: View {
    var selectedGallery : Gallery?
    @Environment(PathStore.self) var pathStore
    
    var body: some View {
        @Bindable var pathStore = pathStore
        NavigationStack(path: $pathStore.path){
            VStack{
                if selectedGallery == nil {
                    Text("No Gallery")
                }
                else{
                    Text(selectedGallery!.name)
                    Divider()
                    Text(selectedGallery!.location)
                    Text(selectedGallery!.description)
                    Divider()
                    Text("List of artists")
                    
                    List(selectedGallery!.artists, id: \.self) {artist in
                        NavigationLink(value: Route.Artist(artist)) {
                            VStack{
                                Text(artist.name)
                                Text(artist.nationality)
                            }
                        }
                        
                        
                    }
                }
            }.navigationDestination(for: Route.self) { route in
                switch route {
                case let .Gallery(gallery: Gallery):
                    GalleryDetailView(selectedGallery: Gallery)
                case let .Artist(artist: Artist):
                    ArtistView(selectedArtist: Artist)
                case let .Artwork(artwork: Artwork):
                    ArtworkView(selectedArtwork: Artwork)
                }
            }
        }
    }
}
