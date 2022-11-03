//
//  SearchShowsView.swift
//  Synesthesia_TestTask
//
//  Created by Alexander Grigoryev on 3.11.2022.
//

import SwiftUI

struct SearchShowsView: View {
    @StateObject var searchShowsViewModel = SearchShowsViewModel()
    var columns: [GridItem] = [
        GridItem(.fixed(400))
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                TextField("Enter a search request", text: $searchShowsViewModel.searchText)
                    .textFieldStyle(.roundedBorder)
                    .textInputAutocapitalization(.never)
                    .onChange(of: searchShowsViewModel.searchText) { _ in
                        searchShowsViewModel.fetchDataFromNetwork(query: searchShowsViewModel.searchText)
                    }
                LazyVGrid(columns: columns, spacing: 5) {
                    ForEach(searchShowsViewModel.TVShows, id: \.self) { shows in
                        NavigationLink {
                            DetailedShowsView(show: shows.show, id: shows.show.id)
                        } label: {
                            SearchShowsCell(title: shows.show.name,
                                            image: shows.show.image.original,
                                            rating: shows.show.rating.average ?? 0)
                        }
                    }
                }
            }.navigationTitle("TV shows")
        }
    }
}
