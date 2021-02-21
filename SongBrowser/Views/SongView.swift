//
//  SongView.swift
//  SongBrowser
//
//  Created by Russell Gordon on 2021-02-20.
//

import SwiftUI

struct SongView: View {
    
    // MARK: Stored properties
    var song: Song
    var fromFavourites: Bool

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

                VStack {
                    Image(systemName: fromFavourites ? "suit.heart.fill" : "suit.heart")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.deepRed)
                    Text(fromFavourites ? "Remove from\nFavourites" : "Add to\nFavourites")
                        .multilineTextAlignment(.center)
                }

                Spacer()
            }
            .padding(.top, 20)
            
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
            SongView(song: exampleSong, fromFavourites: false)
        }
    }
}
