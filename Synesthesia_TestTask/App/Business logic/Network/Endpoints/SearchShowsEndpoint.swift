//
//  SearchShowsEndpoint.swift
//  Synesthesia_TestTask
//
//  Created by Alexander Grigoryev on 3.11.2022.
//

import Foundation

enum SearchShowsEndpoint: EndpointProtocol {
case getShowsSearch(query: String)
    
    var absoluteURL: String {
        return baseURL + "/search/shows"
    }
    
    var parameters: [String : String] {
        switch self {
        case let .getShowsSearch(query):
            return ["q" : query]
        }
    }
}
