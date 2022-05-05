//
//  SearchView.swift
//  SongBrowser
//
//  Created by Russell Gordon on 2021-02-20.
//

import SwiftUI

struct SearchView: View {

    // MARK: Stored properties
    
    // Keeps track of what the user searches for
    @State var searchText: String = ""
    
    // Keeps the list of songs retrieved from Apple Music
    @State var foundSongs: [Song] = [] // empty array to start
    
    // Derived value; a reference to the list of favourite songs
    // The source of truth (original instance) is at the app level
    @Binding var favourites: [Song]

    // MARK: Computed properties
    var body: some View {
        
        NavigationView {
            
            VStack {
                    
                // Include a search bar to populate list below
                SearchBarView(text: $searchText)
                    .padding(.top, 20)
                    .onChange(of: searchText) { _ in
                        fetchResults()
                    }

                // Show a prompt when no search text is given
                if searchText.isEmpty {
                    
                    Spacer()
                    
                    Text("Enter a song or artist name")
                        .font(.title)
                        .foregroundColor(.secondary)
                    
                    Spacer()
                    
                } else {
                    
                    // Search text was given, results obtained
                    // Show the list of results
                    // Keypath of \.trackId tells the List view what property to use
                    // to uniquely identify each song
                    List(foundSongs, id: \.trackId) { currentSong in
                        
                        NavigationLink(destination: SongDetailView(song: currentSong, inFavourites: false, favourites: $favourites)) {
                            ListItemView(song: currentSong)
                        }
                        
                    }
                    
                }
               
            }
            .navigationTitle("Song Browser")

        }
        
    }
    
    // MARK: Functions
    func fetchResults() {
        
        // Sanitize the search input
        // Converts something like "TaYLoR SWiFt" to "taylor+swift"
        let input = searchText.lowercased().replacingOccurrences(of: " ", with: "+")

        // Set the address of the JSON endpoint
        let url = URL(string: "https://itunes.apple.com/search?term=\(input)&entity=song")!

        // Configure a URLRequest instance
        // Defines what type of request will be sent to the address noted above
        var request = URLRequest(url: url)
        request.setValue("application/json",
                         forHTTPHeaderField: "Accept")
        request.httpMethod = "GET"

        // Run the request on a background thread and process the result.
        // NOTE: This occurs asynchronously.
        //       That means we don't know precisely when the request will
        //       complete.
        URLSession.shared.dataTask(with: request) { data, response, error in

            // When the request *does* complete, there are three parameters
            // containing data that are created:
            //
            // data
            // The data returned by the server.
            //
            // response
            // An object that provides response metadata, such as HTTP headers and status code. If you are making an HTTP or HTTPS request, the returned object is actually an HTTPURLResponse object.
            //
            // error
            // An error object that indicates why the request failed, or nil if the request was successful.


            // Verify that some data was actually returned
            guard let resultsData = data else {

                // When no data is returned, provide a descriptive error
                //
                // error?.localizedDescription is an example of "optional chaining"
                // This means that if the error object is not nil, the
                // localizedDescription property will be used
                //
                // ?? "Unknown error" is an example of the "nil coalescing" operator
                // This means that when the error object *is* nil, a default string of
                // "Unknown error" will be provided
                print("No data in response: \(error?.localizedDescription ?? "Unknown error")")

                // Don't continue past this point
                return

            }

            // DEBUG: See what raw JSON data was returned from the server
            print(String(data: resultsData, encoding: .utf8)!)

            // Attempt to decode the JSON into an instance of the SearchResults type
            if let decodedResultsData = try? JSONDecoder().decode(SearchResult.self, from: resultsData) {

                // DEBUG:
                print("Search results decoded from JSON successfully")

                // Now, update the UI on the main thread
                DispatchQueue.main.async {

                    // Assign the result to the "songs" stored property
                    foundSongs = decodedResultsData.results

                }

            } else {

                print("Could not decode JSON into an instance of the SearchResults structure.")

            }

        }.resume()
        // NOTE: Invoking the resume() function
        // on the dataTask closure is key. The request will not
        // run, otherwise.

    }
    
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(favourites: .constant([testSong]))
    }
}
