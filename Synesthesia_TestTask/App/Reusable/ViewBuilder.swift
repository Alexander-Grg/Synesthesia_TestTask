//
//  ViewBuilder.swift
//  Synesthesia_TestTask
//
//  Created by Alexander Grigoryev on 3.11.2022.
//

import Foundation
import SwiftUI
import Kingfisher

struct EditedShowsImage: View {
    var content: KFImage
    var width: CGFloat
    var height: CGFloat
    
    init(@ViewBuilder content: () -> KFImage, width: CGFloat, height: CGFloat) {
        self.content = content()
        self.width = width
        self.height = height
    }
    
    var body: some View {
        content
            .renderingMode(.original)
            .resizable()
            .scaledToFill()
            .frame(width: width, height: height)
            .cornerRadius(5)
    }
}
