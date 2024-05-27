//
//  HomeView.swift
//  BoxFeed
//
//  Created by Husnain Ali on 07/04/24.
//

import SwiftUI
import CoreData

struct HomeView: View {
    
    @StateObject private var viewModel = HomeViewModel()
    
    // CoreData
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(fetchRequest: ArticleCD.getAllArticles()) var articles: FetchedResults<ArticleCD>
    
    @State private var selection = 0
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.primary_color.edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 0) {
                    
                    HeaderView
                    
                    if viewModel.sources.isEmpty {
                        Spacer()
                        ProgressView()
                        Spacer()
                    } else {
                        AutoScrollingTabView(viewModel: viewModel)
                        NewsSelectorView(viewModel: viewModel)
                        .padding(.top, 24)
                        
                        if viewModel.news.isEmpty {
                            Spacer()
                            ProgressView()
                            Spacer()
                        } else {
                            List {
                                ForEach(viewModel.news, id: \.self) { newsData in
                                    loadNews(with: newsData)
                                        .onAppear {
                                            if newsData == viewModel.lastObject {
                                                viewModel.currentPage += 1
                                            }
                                        }
                                }
                            }
                            .refreshable {
                                viewModel.currentPage = 1
                                await viewModel.fetchNews()
                            }
                        }
                        
                        Spacer()
                    }
                }
                .edgesIgnoringSafeArea(.bottom)
                .fullScreenCover(isPresented: $viewModel.showArticle,
                                 onDismiss: { viewModel.selectedArticle = nil }) {
                    if let article = viewModel.selectedArticle {
                        ArticleView(viewModel: ArticleViewModel(model: article))
                    }
                }
                                 .fullScreenCover(isPresented: $viewModel.openBookmarks) {
                                     BookmarksView()
                                 }
            }
            .navigationBarHidden(true)
            .task {
                await viewModel.fetchSources()
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
    
    @ViewBuilder func loadNews(with data: NewsModel) ->  some View {
        Button {
            viewModel.loadNews(with: data)
        } label: {
            NewsModelView(model: data)
                .padding(.vertical, 4)
                .listRowSeparator(.hidden)
        }
        .swipeActions {
            Button {
                viewModel.bookmarkArticle(data, articles, moc)
            } label: {
                Image(systemName: viewModel.isBookmarked(data, articles)
                      ? "bookmark" : "bookmark.fill")
            }
            .tint(.main_color)
        }
    }

    @ViewBuilder private var HeaderView: some View {
        HStack(alignment: .center) {
            Text("The Trends").foregroundColor(.main_color)
                .modifier(FontModifier(.bold, size: 32))
            Spacer()
            Button(action: { viewModel.openBookmarks = true }) {
                Image.bookmark.resizable()
                    .renderingMode(.template)
                    .foregroundColor(.black)
                    .frame(width: 22, height: 22)
            }
        }.padding(.horizontal, 16)
    }
}
