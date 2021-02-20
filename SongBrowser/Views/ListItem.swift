//
//  ListItem.swift
//  SongBrowser
//
//  Created by Russell Gordon on 2021-02-20.
//

import SwiftUI

struct ListItem: View {
    
    var song: Song
    
    var body: some View {

        VStack(alignment: .leading) {
            
            Text(song.trackName)
            
            Text(song.artistName)
                .font(.caption)
            
        }

    }
}

struct ListItem_Previews: PreviewProvider {
    static var previews: some View {
        ListItem(song: exampleSong)
    }
}
