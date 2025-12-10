//
//  FullView.swift
//  Gallery
//
//  Created by Florian Degraeve on 09/12/2025.
//

import SwiftUI

struct FullView: View {
    @State var selectedGallery : Gallery?
    var name: String {
        selectedGallery?.name ?? "Select gallery"
    }
    var body: some View {
        
        VStack {
            TabView{
                Tab("Galleries", systemImage: "tray.and.arrow.down.fill") {
                    GalleriesView(selectedGallery: $selectedGallery)
                }
                Tab(name, systemImage: "tray.and.arrow.down.fill" ){
                    GalleryDetailView(selectedGallery: selectedGallery)
                }
            }
        }
    }
}
