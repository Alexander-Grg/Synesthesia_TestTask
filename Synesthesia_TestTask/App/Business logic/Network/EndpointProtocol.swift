//
//  EndpointProtocol.swift
//  Synesthesia_TestTask
//
//  Created by Alexander Grigoryev on 3.11.2022.
//

import Foundation

protocol EndpointProtocol {
    var baseURL: String { get }
    var absoluteURL: String { get }
    var parameters: [String : String] { get }
}

extension EndpointProtocol {
    var baseURL: String {
        return "https://api.tvmaze.com"
    }
    
}
