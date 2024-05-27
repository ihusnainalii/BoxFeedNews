//
//  Headline.swift
//  BoxFeed
//
//  Created by Husnain Ali on 26/05/2024.
//

import SwiftUI

struct HeadlineView: View {
    
    let imageUrl: URL?
    let title: String
    
    var body: some View {
        if let imageUrl {
            AsyncImage(url: imageUrl) { image in
                ZStack(alignment: .bottom) {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(height: 200)
                        .opacity(1)
                        .clipped()
                    
                    Text(title)
                        .foregroundColor(.white)
                        .padding(8)
                        .background(Color.black.opacity(0.5))
                        .multilineTextAlignment(.leading)
                        .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                }
            } placeholder: {
                ProgressView()
            }
        }
    }
}

#Preview {
    HeadlineView(imageUrl: URL(string: DemoData.image) ?? nil, title: DemoData.title)
}

struct DemoData {
    static let image = "https://plus.unsplash.com/premium_photo-1678112180202-cd950dbe5a35?q=80&w=3270&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    static let title = "Manchester United wins Manchester United wins Manchester United wins Manchester United wins Manchester United wins Manchester United wins Manchester United wins Manchester United wins "
}
