//
//  ViewModifier.swift
//  Synesthesia_TestTask
//
//  Created by Alexander Grigoryev on 3.11.2022.
//

import Foundation
import SwiftUI

struct HelveticaNeue: ViewModifier {
    let size: CGFloat
    
    func body(content: Content) -> some View {
        content
            .font(Font.custom("HelveticaNeue", size: size))
            .foregroundColor(Color("TextColor"))
    }
}
