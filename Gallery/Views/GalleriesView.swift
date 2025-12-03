//
//  GalleryView.swift
//  Gallery
//
//  Created by Florian Degraeve on 03/12/2025.
//

import SwiftUI

struct GalleriesView: View {
    @Environment(GalleryDataStore.self) private var dataStore
    @Environment(PathStore.self) var pathStore
    @State var loading = true
    var body: some View {
        
        @Bindable var pathStore = pathStore
        VStack{
            if loading { ProgressView("Loading...")}
            else{
                NavigationStack(path: $pathStore.path){
                    List(
                        dataStore.getGaleries() ,id: \.self) { gallery in
                            NavigationLink(value: Route.Gallery(gallery)) {
                                VStack{
                                    Text(gallery.name)
                                    Text(gallery.description)
                                }
                            }
                        }
                        .navigationDestination(for: Route.self) { route in
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
            }.task {
                await dataStore.loadData()
                loading = false
            }
    }
}

