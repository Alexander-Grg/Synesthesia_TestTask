//
//  SearchShowsViewModel.swift
//  Synesthesia_TestTask
//
//  Created by Alexander Grigoryev on 3.11.2022.
//

import Foundation
import SwiftUI
import Combine

@MainActor final class SearchShowsViewModel: ObservableObject {
    private let searchShowsService = SearchShowsService()
    private var cancellable = Set<AnyCancellable>()
    @Published var searchText = ""
    @Published var TVShows: [StartElement] = []
    
    func fetchDataFromNetwork(query: String) {
        searchShowsService.requestShowsSearch(query: query)
            .decode(type: StartSearch.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { error in
                print(error)
            }, receiveValue: { [weak self] value in
                guard let self = self else { return }
                
                self.TVShows = value
            }
            )
            .store(in: &cancellable)
    }
}
