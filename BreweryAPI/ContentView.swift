//
//  ContentView.swift
//  BreweryAPI
//
//  Created by Smith, Oli (AMM) on 24/05/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var search: String = ""
    @State private var results: [ApiResult] = []
    
    @State private var searchId: String = ""
    
    @ObservedObject var apiManager = ApiManager.shared
    
    var body: some View {
        NavigationStack {
            TextField("Enter search item:", text: $search)
                .padding()
                .onChange(of: search) { oldValue, newValue in
                    print("The new value is \(newValue)")
                    apiManager.searchFor(query: newValue) { results in
                        self.results = results
                    }
            }
            Text("API Results: ")
            
            ForEach(results, id: \.id) { results in
                NavigationLink("\(results.name)") {
                    BreweryDetailView(breweryId: results.id)
                }
            }
            
            TextField("Enter Brewery ID: ", text: $searchId)
                .padding()
                .onChange(of: searchId) { oldValue, newValue in
                    apiManager.searchWithId(query: newValue) { results in
                        self.results = results
                    }
                }
//            BreweryDetailView(breweryId: apiManager.completionHandler(query: searchId) { results in
//                self.results = results
//            })
        }
        .navigationTitle("Brewery API: ")
    }
}

#Preview {
    ContentView()
}
