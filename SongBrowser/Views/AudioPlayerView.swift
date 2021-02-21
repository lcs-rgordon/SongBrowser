//
//  AudioPlayerView.swift
//  SongBrowser
//
//  Created by Russell Gordon on 2021-02-20.
//

import AVKit
import SwiftUI

// SOURCE: https://medium.com/swift-productions/swiftui-play-an-audio-with-avaudioplayer-1c4085e2052c

struct AudioPlayerView: View {
    
    @State var audioPlayer: AVPlayer = AVPlayer()
    var urlOfSongToPlay: String
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                Spacer()
                
                Button(action: {
                    self.audioPlayer.play()
                }) {
                    Image(systemName: "play.circle.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .aspectRatio(contentMode: .fit)
                }
                
                Spacer()
                
                Button(action: {
                    self.audioPlayer.pause()
                }) {
                    Image(systemName: "pause.circle.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .aspectRatio(contentMode: .fit)
                }
                
                Spacer()
            }
            
        }
        .onAppear {
            
            // Create a URL instance from the preview URL
            let url = URL(string: urlOfSongToPlay)!
            
            // Make an instance of the AVPlayerItem class
            let playerItem = AVPlayerItem(url: url)
            
            // Set the player
            audioPlayer = AVPlayer(playerItem: playerItem)
            
            // Set the volume
            audioPlayer.volume = 0.5
            
        }
        .onDisappear() {
            audioPlayer.pause()
        }
    }
    
}

struct AudioPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        AudioPlayerView(urlOfSongToPlay: exampleSong.previewUrl)
    }
}
