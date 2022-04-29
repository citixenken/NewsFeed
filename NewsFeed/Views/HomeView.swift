//
//  HomeView.swift
//  NewsFeed
//
//  Created by Ken Muyesu on 29/04/2022.
//

import SwiftUI

struct HomeView: View {
    @Environment(\.openURL) var openUrl
    
    @StateObject var viewModel = NewsViewModelImplementation(service: NewsServiceImplementation())
    
    var body: some View {
        Group {
            switch viewModel.state {
            case .loading:
                ProgressView()
            case .success(let articles):
                NavigationView {
                    List(articles) { item in
                        ArticleView(article: item)
                            .onTapGesture {
                                load(url: item.url)
                            }
                    }
                    .navigationTitle("NewsFeed")
                    .navigationBarTitleDisplayMode(.inline)
                }
            case .failed(let error):
                //handler allows for reload via button
                ErrorView(error: error, handler: viewModel.getArticles)
            }
        }
        .onAppear(perform: viewModel.getArticles)
    }
    
    func load(url: String?) {
        guard let link = url, let url = URL(string: link) else { return }
        
        openUrl(url)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
