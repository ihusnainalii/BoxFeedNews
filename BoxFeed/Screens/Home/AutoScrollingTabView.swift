//
//  AutoScrollingTabView.swift
//  BoxFeed
//
//  Created by Husnain Ali - ILI on 26/05/2024.
//

import SwiftUI

struct AutoScrollingTabView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    @State private var selection = 0
    
    private let timer = Timer.publish(every: 10.0, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            if viewModel.headlines.isEmpty {
                ProgressView()
            } else {
                TabView(selection: $selection) {
                    ForEach(0..<viewModel.headlines.count, id: \.self) { headlineIndex in
                        Button {
                            viewModel.loadNews(with: viewModel.headlines[headlineIndex])
                        } label: {
                            HeadlineView(imageUrl: viewModel.headlines[headlineIndex].urlToImage, title: viewModel.headlines[headlineIndex].title ?? "")
                        }
                        .tag(headlineIndex)
                    }
                }
                .frame(height: 200)
                .tabViewStyle(.page(indexDisplayMode: .never))
                .onReceive(timer) { _ in
                    withAnimation {
                        selection = (selection + 1) % viewModel.headlines.count
                    }
                }
            }
        }
        .background(Color.appBgColor)
        .task {
            await viewModel.fetchTopHeadlines()
        }
    }
}

#Preview {
    AutoScrollingTabView(viewModel: HomeViewModel())
}
