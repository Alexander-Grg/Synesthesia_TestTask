//
//  SearchShowsCell.swift
//  Synesthesia_TestTask
//
//  Created by Alexander Grigoryev on 3.11.2022.
//

import SwiftUI
import Kingfisher

struct SearchShowsCell: View {
    let title: String
    let image: String
    let genres: String
    let rating: Double

    var body: some View {
        VStack {
            KFImage.url(URL(string: image))
                .resizable()
                .aspectRatio(contentMode: .fit)
                Text(title)
                    .font(.headline)
            Text(genres)
                .font(.system(size: 14))
            Text(String(rating))
        }
    }
}
