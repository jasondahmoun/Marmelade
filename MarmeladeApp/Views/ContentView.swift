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
                Color.white.edgesIgnoringSafeArea(.all)
                VStack {
                    Rectangle()
                        .fill( LinearGradient(gradient: Gradient(colors: [Color.color1, Color.color2, Color.color3, Color.color4, Color.color5, Color.color6, Color.color7]),
                                              startPoint: .trailing,
                                              endPoint: .leading ))
                        .frame(height: 380)
                        .ignoresSafeArea(.all, edges: .top)
                    Spacer()
                }
                VStack {
                    Spacer()
                    Rectangle()
                        .fill(Color.white)
                        .frame(height: 580)
                        .cornerRadius(30)
                        .shadow(color: .gray, radius: 15, x: 0, y: -5)
                        .ignoresSafeArea()
                }
                VStack {
                    if currentIndex < quotes.count {
                        SmylerView(author: quotes[currentIndex].author, quote: quotes[currentIndex].quote, currentIndex: $currentIndex, totalCount: quotes.count) }
                }
                .onAppear(perform: {
                    Network.shared.apollo.fetch(query: AllQuotesQuery()) { result in
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
