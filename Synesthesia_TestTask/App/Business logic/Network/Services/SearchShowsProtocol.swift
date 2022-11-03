//
//  SearchShowsProtocol.swift
//  Synesthesia_TestTask
//
//  Created by Alexander Grigoryev on 3.11.2022.
//

import Foundation
import Combine

protocol SearchShowsProtocol {
    func requestShowsSearch(query: String) -> AnyPublisher<Data, Error>
}

final class SearchShowsService: SearchShowsProtocol {
    private let apiProvider = APIProvider<SearchShowsEndpoint>()
    
    func requestShowsSearch(query: String) -> AnyPublisher<Data, Error> {
        return apiProvider.getData(from: .getShowsSearch(query: query))
            .eraseToAnyPublisher()
    }
}
