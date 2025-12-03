//
//  datastore.swift
//  Gallery
//
//  Created by Florian Degraeve on 03/12/2025.
//

import Foundation

@Observable
class GalleryDataStore {
    private var galleries = Galleries()
    
    init(){
        
       
    }
    
    func getGaleries() -> [Gallery] {
        return galleries.galleries
    }
    
    func getArtist(artwork: Artwork) -> Artist {
        let artist = galleries.galleries.map { gallery in
            gallery.artists
        }.flatMap { $0}
        return artist.filter { artist in
            artist.artworks.contains(artwork)}[0]
        
    }
    func getArtworkInSameGallery(artwork: Artwork) -> [Artwork] {
        return galleries.galleries.filter { gallery in
            gallery.artists.contains(getArtist(artwork: artwork))
        }[0].artists.map { artist in
            artist.artworks
        }.flatMap { artwork in
            artwork
        }
    }
    
    
    
    
    private func sort() {
        galleries.galleries = galleries.galleries.sorted()
    }
    
    func loadData() async {
        //simulate async call
        do {
            print("⏳ Simulating 2-second load delay...")
            try await Task.sleep(for: .seconds(2)) // Simulate long load
            galleries = try load("galleries.json")
            sort()
            print("✅ Data loaded successfully.")
            
        } catch {
            print("❌ Failed to load uurrooster:", error)
            //movies is lege array
        }
    }
}
