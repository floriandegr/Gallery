//
//  GalleryView.swift
//  Gallery
//
//  Created by Florian Degraeve on 03/12/2025.
//

import SwiftUI

struct GalleriesView: View {
    @Environment(GalleryDataStore.self) private var dataStore
    
    @State var loading = true
    @Binding var selectedGallery : Gallery?
    var body: some View {
        
        
        VStack{
            if loading { ProgressView("Loading...")}
            else{
                
                    List(
                        dataStore.getGaleries() ,id: \.self) { gallery in
                            Button(action: {
                                selectedGallery = gallery
                            }, label: {
                                VStack{
                                    Text(gallery.name)
                                    Text(gallery.description)
                                }
                            })
                        }
                }
            
            }.task {
                await dataStore.loadData()
                loading = false
            }
    }
}

