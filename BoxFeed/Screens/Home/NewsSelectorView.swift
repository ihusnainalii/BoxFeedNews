//
//  NewsSelectorView.swift
//  BoxFeed
//
//  Created by Husnain Ali on 07/04/24.
//

import SwiftUI

struct NewsSelectorView: View {
    
    @Binding var selection: Sources
    @Binding var currentPage: Int
    private let sources = Sources.allCases
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top) {
                ForEach(sources) { source in
                    VStack(spacing: 8) {
                        Text(source.name)
                            .foregroundColor(Color.text_primary)
                            .modifier(FontModifier(.bold, size: 14))
                            .layoutPriority(1)
                            .fixedSize(horizontal: true, vertical: false)
                        if selection == source {
                            Rectangle().frame(height: 2)
                                .foregroundColor(.main_color)
                        }
                    }
                    .padding(.horizontal, 8)
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            selection = source
                        }
                    }
                }
            }.padding(.horizontal, 12)
        }
    }
}
