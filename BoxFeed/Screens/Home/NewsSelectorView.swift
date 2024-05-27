//
//  NewsSelectorView.swift
//  BoxFeed
//
//  Created by Husnain Ali on 07/04/24.
//

import SwiftUI

struct NewsSelectorView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top) {
                ForEach(viewModel.sources) { source in
                    VStack(spacing: 8) {
                        Text(source.name ?? "Unknown")
                            .foregroundColor(.appTextColor)
                            .modifier(FontModifier(.bold, size: 14))
                            .layoutPriority(1)
                            .fixedSize(horizontal: true, vertical: false)
                        
                        if viewModel.selection == source {
                            Rectangle().frame(height: 2)
                                .foregroundColor(.appTextColor)
                        }
                    }
                    .padding(.horizontal, 8)
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            viewModel.selection = source
                        }
                    }
                }
            }.padding(.horizontal, 12)
        }
        .background(Color.appBgColor)
    }
}
