//
//  AutoScrollingTabView.swift
//  BoxFeed
//
//  Created by Husnain Ali - ILI on 26/05/2024.
//

import SwiftUI

struct AutoScrollingTabView: View {
    
    @Binding var headlines: [NewsModel]
    @State private var selection = 0
    
    private let timer = Timer.publish(every: 2.0, on: .main, in: .common).autoconnect()
    
    var body: some View {
        TabView(selection: $selection) {
            ForEach(headlines, id: \.self) { headline in
                HeadlineView(imageUrl: headline.url, title: headline.title ?? "")
            }
        }
        .frame(height: 200)
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
        .onReceive(timer) { _ in
            withAnimation {
                let next = selection + 1
                if next < headlines.count - 1 {
                    selection = next
                } else {
                    selection = 0
                }
            }
        }
    }
}

#Preview {
    AutoScrollingTabView(headlines: .constant([]))
}
