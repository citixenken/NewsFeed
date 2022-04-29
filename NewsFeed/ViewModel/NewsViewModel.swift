//
//  NewsViewModel.swift
//  NewsFeed
//
//  Created by Ken Muyesu on 29/04/2022.
//

import Foundation
import Combine

protocol NewsViewModel {
    func getArticles()
}

class NewViewModelImplementation: ObservableObject, NewsViewModel {
    private let service: NewsService
    private(set) var articles = [Article]()
    private var cancellables = Set<AnyCancellable>()
    
    @Published private(set) var state: ResultState = .loading
    
    init(service: NewsService) {
        self.service = service
    }
    func getArticles() {
        self.state = .loading
        
        let cancellable = service
            .request(from: .getNews)
            .sink { result in
                switch result {
                    
                case .finished:
                    //send back articles
                    self.state = .success(content: self.articles)
                case .failure(let error):
                    //send back error
                    self.state = .failed(error: error)
                }
            } receiveValue: { response in
                self.articles = response.articles
            }
        self.cancellables.insert(cancellable)
    }
}
