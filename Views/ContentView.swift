//
//  ContentView.swift
//  MarmeladeApp
//
//  Created by Jason Dahmoun on 25/05/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var quotes: [AllQuotesQuery.Data.Quote] = []
    @State var currentIndex = 0
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.white
                    .ignoresSafeArea()
             
                VStack {
                    if currentIndex < quotes.count {
                        SmylerView(author: quotes[currentIndex].author, quote: quotes[currentIndex].quote, currentIndex: $currentIndex, totalCount: quotes.count) }
                }
                .onAppear(perform: {
                    Network.shared.apollo.fetch(query: AllQuotesQuery()) {result in
                        switch result {
                        case .success(let graphQLResult):
                            if let quotes = graphQLResult.data?.quotes {
                                DispatchQueue.main.async {
                                    self.quotes = quotes
                                }
                            }
                        case .failure(let error):
                            print("Error\(error.localizedDescription)")
                        }
                    }
                })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
