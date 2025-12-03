//
//  GalleryApp.swift
//  Gallery
//
//  Created by Florian Degraeve on 03/12/2025.
//

import SwiftUI

@main
struct GalleryApp: App {
    @State var dataStore = GalleryDataStore()
    @State var pathStore = PathStore()
    var body: some Scene {
        WindowGroup {
            ContentView().environment(dataStore).environment(pathStore)
        }
    }
}
