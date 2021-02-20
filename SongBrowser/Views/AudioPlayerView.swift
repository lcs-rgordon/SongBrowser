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
    
    @State var audioPlayer: AVAudioPlayer!
    
    var body: some View {
        
        VStack {
            
            Text("Play").font(.system(size: 45)).font(.largeTitle)
            
            HStack {
                
                Spacer()
                
                Button(action: {
                    self.audioPlayer.play()
                }) {
                    Image(systemName: "play.circle.fill").resizable()
                        .frame(width: 50, height: 50)
                        .aspectRatio(contentMode: .fit)
                }
                
                Spacer()
                
                Button(action: {
                    self.audioPlayer.pause()
                }) {
                    Image(systemName: "pause.circle.fill").resizable()
                        .frame(width: 50, height: 50)
                        .aspectRatio(contentMode: .fit)
                }
                
                Spacer()
            }
            
        }
        .onAppear {
            let sound = Bundle.main.path(forResource: "song", ofType: "mp3")
            self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        }
    }
    
}

struct AudioPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        AudioPlayerView()
    }
}
