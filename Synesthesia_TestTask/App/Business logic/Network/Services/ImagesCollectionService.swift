//
//  ImagesCollectionService.swift
//  Synesthesia_TestTask
//
//  Created by Alexander Grigoryev on 3.11.2022.
//

import Foundation
import Combine

protocol ImagesCollectionProtocol {
    func requestShowsSearch(id: Int) -> AnyPublisher<Data, Error>
}

final class ImagesCollectionService: ImagesCollectionProtocol {
    private let apiProvider = APIProvider<ImagesCollectionEndpoint>()
    
    func requestShowsSearch(id: Int) -> AnyPublisher<Data, Error> {
        return apiProvider.getData(from: .getShowsSearch(id: id))
            .eraseToAnyPublisher()
    }
}
