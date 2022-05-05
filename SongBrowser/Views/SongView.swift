//
//  SongView.swift
//  SongBrowser
//
//  Created by Russell Gordon on 2021-02-20.
//

import SwiftUI

struct SongView: View {
    
    // MARK: Stored properties
    
    // Song to show in this view
    var song: Song
    
    // Whether this song is in the Favourites list or not
    @State var inFavourites: Bool
    
    // A reference to the list of favourite songs
    // This is a derived value; source of truth is at the app level
    @Binding var favourites: [Song]
    
    // MARK: Computed properties
    var body: some View {
        
        VStack(alignment: .leading) {
            
            HStack {
                
                SongImageView(previewImageToShow: song.artworkUrl100)
                
                VStack(alignment: .leading) {
                    
                    Text(song.trackName)
                        .font(.title)
                    
                    Text(song.artistName)
                        .font(.subheadline)
                    
                }
                
            }
            
            AudioPlayerView(urlOfSongToPlay: song.previewUrl)
                .padding(.top, 20)
            
            HStack {
                Spacer()
                
                Button(action: {
                    
                    // When not already in the list of favourites, add this song
                    if !inFavourites {
                        
                        favourites.append(song)
                        inFavourites = true
                        
                    } else {
                        
                        // Find where this song is in the list of songs, then remove it
                        favourites.removeAll(where: { theSong in
                            theSong.trackId == song.trackId
                        })
                        inFavourites = false
                    }
                    
                }) {
                    
                    VStack {
                        Image(systemName: inFavourites ? "suit.heart.fill" : "suit.heart")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(Color("deepRed"))
                        Text(inFavourites ? "Remove from\nFavourites" : "Add to\nFavourites")
                            .multilineTextAlignment(.center)
                    }
                    
                }
                
                Spacer()
                
            }
            .padding(.top, 20)
            
            Text("Store Links")
                .font(.title2)
                .bold()
                .padding(.top, 20)
            
            Link("View artist", destination: URL(string: song.artistViewUrl)!)
                .padding(.top, 5)
            
            Link("View album", destination: URL(string: song.collectionViewUrl)!)
                .padding(.top, 5)

            
            Spacer()
                .frame(maxWidth: .infinity)
            
        }
        .padding()
        // Make the nav bar be "small" at top of view
        .navigationBarTitleDisplayMode(.inline)
        
    }
    
}

struct SongView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SongView(song: testSong,
                     inFavourites: false,
                     favourites: .constant([]))
        }
    }
}
