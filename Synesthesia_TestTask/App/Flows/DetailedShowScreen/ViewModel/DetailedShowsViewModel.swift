//
//  DetailedShowsViewModel.swift
//  Synesthesia_TestTask
//
//  Created by Alexander Grigoryev on 3.11.2022.
//

import Foundation
import Combine

@MainActor final class DetailedShowsViewModel: ObservableObject {
    private let imagesCollectionService = ImagesCollectionService()
    private var cancellable = Set<AnyCancellable>()
    @Published var imagesCollection: [ImagesCollectionElement] = []
    
    func fetchDataFromNetwork(id: Int) {
        imagesCollectionService.requestShowsSearch(id: id)
            .decode(type: ImagesCollectionModel.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { error in
                print(error)
            }, receiveValue: { [weak self] value in
                guard let self = self else { return }
                self.imagesCollection = value
            }
            )
            .store(in: &cancellable)
    }
}
