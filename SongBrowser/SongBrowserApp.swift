//
//  SongBrowserApp.swift
//  SongBrowser
//
//  Created by Russell Gordon on 2021-02-20.
//

import SwiftUI

@main
struct SongBrowserApp: App {
    
    // MARK: Stored properties
    
    // Source of truth for the list of favourite songs
    @StateObject var store = SongStore()
    
    var body: some Scene {
        WindowGroup {
            
            TabView {

                ContentView(store: store)
                    .tabItem {
                        Image(systemName: "doc.text.magnifyingglass")
                        Text("Search")
                    }
                
                FavouritesView(store: store)
                    .tabItem {
                        Image(systemName: "suit.heart.fill")
                        Text("Favourites")
                    }
            }
                        
        }
    }
}
