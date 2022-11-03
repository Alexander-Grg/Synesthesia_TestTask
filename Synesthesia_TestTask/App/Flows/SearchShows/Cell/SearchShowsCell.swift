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
    let rating: Double

    var body: some View {
        VStack {
            KFImage.url(URL(string: image))
                .resizable()
                .aspectRatio(contentMode: .fit)
                Text(title)
                .modifier(HelveticaNeue(size: 22))
            Text(String("Rating: \(rating.removeZerosFromEnd())"))
                .modifier(HelveticaNeue(size: 22))
        }
    }
}
