//
//  DetailedShowsView.swift
//  Synesthesia_TestTask
//
//  Created by Alexander Grigoryev on 3.11.2022.
//

import SwiftUI
import Kingfisher

struct DetailedShowsView: View {
    @StateObject var viewModel = DetailedShowsViewModel()
    let show: Show
    var id: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            GeometryReader { geometry in
                if let image = viewModel.imagesCollection.first {
                    KFImage(URL(string: image.resolutions.original.url))
                        .resizable()
                        .edgesIgnoringSafeArea(.top)
                        .scaledToFill()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geometry.size.width, height: geometry.size.height / 2)
                }
            }
            GeometryReader { geo in
                ScrollView {
                    VStack {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(alignment: .firstTextBaseline, spacing: 10) {
                                ForEach(viewModel.imagesCollection, id: \.self) { image in
                                    EditedShowsImage(content: {
                                        KFImage(URL(string: image.resolutions.original.url))
                                    }, width: 130, height: 180)
                                }
                            }
                        }
                        HStack {
                            ForEach(show.genres, id: \.self) { genre in
                                Text(genre)
                                    .modifier(HelveticaNeue(size: 14))
                            }
                        }
                        Text("Information")
                            .modifier(HelveticaNeue(size: 24))
                            .padding(.leading, 25)
                        Group {
                            Text("Country: \(show.network?.country?.name ?? "information unavailable")")
                            Text("Official website: \(show.network?.officialSite ?? "information unavailable")")
                            Text("Release date: \(show.premiered ?? "information unavailable")")
                        }
                        .modifier(HelveticaNeue(size: 14))
                        Text("Description")
                            .modifier(HelveticaNeue(size: 24))
                            .padding(.leading, 25)
                        Text(show.summary?.trimmingCharacters(in: CharacterSet(charactersIn: "<p>, >, </b>, <i>")) ?? "Summary is unavailable")
                            .modifier(HelveticaNeue(size: 14))
                    }
                    //                    Spacer()
                }.frame(width: geo.size.width , height: geo.size.height)
            }.background(.white)
                .cornerRadius(14)
        }
        .padding(.top, 10)
        .onAppear {
            viewModel.fetchDataFromNetwork(id: id)
        }
    }
}
