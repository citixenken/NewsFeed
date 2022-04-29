//
//  HomeView.swift
//  NewsFeed
//
//  Created by Ken Muyesu on 29/04/2022.
//

import SwiftUI

struct HomeView: View {
    
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
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
