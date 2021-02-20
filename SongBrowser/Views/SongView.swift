//
//  SongView.swift
//  SongBrowser
//
//  Created by Russell Gordon on 2021-02-20.
//

import SwiftUI

struct SongView: View {
    
    var song: Song
    
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
            SongView(song: exampleSong)
        }
    }
}
