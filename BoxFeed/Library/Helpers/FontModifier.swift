//
//  FontModifier.swift
//  BoxFeed
//
//  Created by Husnain Ali on 06/04/24.
//

import SwiftUI

enum CirceFontType: String {
    case regular = "Circe-Regular"
    case bold = "Circe-Bold"
    case extraBold = "Circe-ExtraBold"
}

struct FontModifier: ViewModifier {
    
    var type: CirceFontType, size: CGFloat
    
    init(_ type: CirceFontType, size: CGFloat) {
        self.type = type
        self.size = size
    }
    
    func body(content: Content) -> some View {
        content.font(Font.custom(type.rawValue, size: size))
    }
}
