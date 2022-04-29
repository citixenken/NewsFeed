//
//  NewsResponse.swift
//  NewsFeed
//
//  Created by Ken Muyesu on 29/04/2022.
//

import Foundation

// MARK: - Welcome
struct NewsResponse: Codable {
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable, Identifiable {
    let id = UUID()
    let author: String?
    let url: String?
    let source, title, articleDescription: String?
    let image: String?
    let date: Date?

    enum CodingKeys: String, CodingKey {
        case author, url, source, title
        case articleDescription = "description"
        case image, date
    }
}

//dummy data
extension Article {
    static var dummyData: Article {
        .init(author: "Tariq Panja",
              url: "https://www.nytimes.com/2022/04/29/sports/soccer/chelsea-ratcliffe-sale.html",
              source: "New York Times",
              title: "British Billionaire Jim Ratcliffe Bids $5.3 Billion for Chelsea F.C. - The New York Times",
              articleDescription: "The late offer for the Premier League soccer club by Ratcliffe, the chief executive of Ineos, would be the highest price ever paid for a sports team.",
              image: "https://static01.nyt.com/images/2022/04/29/multimedia/29soccer-chelsea/29soccer-chelsea-facebookJumbo.jpg",
              date: Date.now)
    }
}




