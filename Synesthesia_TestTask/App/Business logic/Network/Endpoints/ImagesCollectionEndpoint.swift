//
//  ImagesCollectionEndpoint.swift
//  Synesthesia_TestTask
//
//  Created by Alexander Grigoryev on 3.11.2022.
//

import Foundation

enum ImagesCollectionEndpoint: EndpointProtocol {
case getShowsSearch(id: Int)
    
    var absoluteURL: String {
        switch self {
        case let .getShowsSearch(id: id):
            return baseURL + "/shows/\(id)/images"
        }
    }

    var parameters: [String : String] {
        return [:]
    }
}
