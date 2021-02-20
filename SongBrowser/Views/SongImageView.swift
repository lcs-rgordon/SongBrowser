//
//  SongImageView.swift
//  SongBrowser
//
//  Created by Russell Gordon on 2021-02-20.
//

import SwiftUI

struct SongImageView: View {
    
    @State var image: UIImage = UIImage()
    var previewImageToShow: String
    
    var body: some View {
        Image(uiImage: image)
            .onAppear {
                
                // Create a URL instance from the preview URL
                let url = URL(string: previewImageToShow)!
                
                // Load the remote image
                image = UIImage(data: try! Data(contentsOf: url))!
            }
    }
}

struct SongImageView_Previews: PreviewProvider {
    static var previews: some View {
        SongImageView(previewImageToShow: exampleSong.artworkUrl100)
    }
}
