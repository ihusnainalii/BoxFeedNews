//
//  BookmarksView.swift
//  BoxFeed
//
//  Created by Husnain Ali on 18/03/24.
//

import SwiftUI

struct BookmarksView: View {
    
    @Environment(\.dismiss) var dismiss
    @StateObject private var viewModel = BookmarksViewModel()
    // CoreData
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(fetchRequest: ArticleCD.getAllArticles()) var articles: FetchedResults<ArticleCD>
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.appBgColor.edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 0) {
                    headerView
                    List {
                        ForEach(articles) { article in
                            Button(action: { viewModel.selectArticle(article) }) {
                                NewsModelView(model: viewModel.getNewsModel(article))
                                    .padding(.vertical, 4)
                                    .listRowSeparator(.hidden)
                            }.swipeActions {
                                Button(action: {
                                    viewModel.removeBookmark(article, moc)
                                }) {
                                    Image(systemName: "bookmark")
                                }
                                .tint(.appBgColor)
                            }
                        }
                    }
                    
                    Spacer()
                }
                .edgesIgnoringSafeArea(.bottom)
                .fullScreenCover(isPresented: $viewModel.showArticle,
                                 onDismiss: { viewModel.selectedArticle = nil }) {
                    if let article = viewModel.selectedArticle {
                        ArticleView(viewModel: ArticleViewModel(model: viewModel.getNewsModel(article)))
                    }
                }
            }
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
    
    private var headerView: some View {
        HStack {
            Text("Bookmarks")
                .foregroundColor(.appTextColor)
                .modifier(FontModifier(.bold, size: 32))
            Spacer()
            Button(action: { dismiss() }) {
                Image.x.resizable()
                    .renderingMode(.template)
                    .foregroundColor(.appTextColor)
                    .frame(width: 26, height: 26)
            }
        }.padding(.horizontal, 20)
    }
}
