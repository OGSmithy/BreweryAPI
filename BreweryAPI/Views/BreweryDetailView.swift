//
//  BreweryDetailView.swift
//  BreweryAPI
//
//  Created by Smith, Oli (AMM) on 24/05/2024.
//

import SwiftUI

struct BreweryDetailView: View {
    
    @State var breweryId: String
    
    var body: some View {
        VStack {
            Text("\(breweryId)")
            
            
            
        }
        .onAppear(BreweryDetailView(breweryId: apiManager.completionHandler(query: searchId) { results in
                self.results = results
            ))
        // call some api manager method passing in the brewery id
        // use a completion handler to set the brewery detail of this view
        
    }
}

#Preview {
    BreweryDetailView(breweryId: "")
}
