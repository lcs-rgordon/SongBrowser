//
//  FavouritesView.swift
//  SongBrowser
//
//  Created by Russell Gordon on 2021-02-21.
//

import SwiftUI

struct FavouritesView: View {
    
    // MARK: Computed properties
    var body: some View {
        
        NavigationView {
            
            VStack {
                // Show message if no favourites noted
                if favouriteSongs.isEmpty {

                    Spacer()
                    
                    Text("No favourite songs yet")
                        .font(.title)
                        .foregroundColor(.secondary)
                    
                    Spacer()

                } else {

                    // Show list of favourite songs
                    List(favouriteSongs, id: \.trackId) { currentSong in
                        
                        NavigationLink(destination: SongView(song: currentSong, fromFavourites: true)) {
                            ListItemView(song: currentSong)
                        }
                        
                    }
                    
                }
            }
            .navigationTitle("Favourites")
            
        }
        
    }
}

struct FavouritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesView()
    }
}
