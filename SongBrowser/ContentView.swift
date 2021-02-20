//
//  ContentView.swift
//  SongBrowser
//
//  Created by Russell Gordon on 2021-02-20.
//

import SwiftUI

struct ContentView: View {

    // MARK: Stored properties
    @State private var searchText: String = ""

    // MARK: Computed properties
    var body: some View {
        
        VStack {
                
            // Include a search bar to populate list below
            SearchBarView(text: $searchText)
                .padding(.top, 20)

            // Show a prompt when no search text is given
            if searchText.isEmpty {
                
                Spacer()
                
                Text("Please enter an artist name")
                    .font(.title)
                    .foregroundColor(.secondary)
                
                Spacer()
                
            } else {
                
                // For now, show nothing when a search is active
                Spacer()
                
            }
           
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
