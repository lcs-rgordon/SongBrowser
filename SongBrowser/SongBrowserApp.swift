//
//  SongBrowserApp.swift
//  SongBrowser
//
//  Created by Russell Gordon on 2021-02-20.
//

import SwiftUI

@main
struct SongBrowserApp: App {
    var body: some Scene {
        WindowGroup {
            
            TabView {

                ContentView()
                    .tabItem {
                        Image(systemName: "doc.text.magnifyingglass")
                        Text("Search")
                    }
                
                FavouritesView()
                    .tabItem {
                        Image(systemName: "suit.heart")
                        Text("Favourites")
                    }
            }
                        
        }
    }
}
