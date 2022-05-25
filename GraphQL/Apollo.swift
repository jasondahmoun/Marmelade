//
//  Apollo.swift
//  MarmeladeApp
//
//  Created by Jason Dahmoun on 25/05/2022.
//

import Foundation
import Apollo

class Network {
    
    static let shared = Network()
    lazy var apollo = ApolloClient(url: URL(string: "https://demotivation-quotes-api.herokuapp.com/")!)
    
    private init() {
        
    }
    
}
