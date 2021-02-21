//
//  SongStore.swift
//  SongBrowser
//
//  Created by Russell Gordon on 2021-02-21.
//

import Foundation
import SwiftUI

class SongStore: ObservableObject {
    
    @Published var favourites: [Song]
    
    // MARK: Initializer
    init(favourites: [Song] = []) {
        self.favourites = favourites
    }
    
}

// Create an object to use with Xcode previews that contains a song
var testStore = SongStore(favourites: [exampleSong])
