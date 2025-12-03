//
//  GalleryDetailView.swift
//  Gallery
//
//  Created by Florian Degraeve on 03/12/2025.
//

import SwiftUI

struct GalleryDetailView: View {
    @State var selectedGallery : Gallery?
    var body: some View {
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
        }
    }
}
