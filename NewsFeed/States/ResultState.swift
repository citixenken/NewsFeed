//
//  ResultState.swift
//  NewsFeed
//
//  Created by Ken Muyesu on 29/04/2022.
//

import Foundation

enum ResultState {
    case loading
    case success(content: [Article])
    case failed(error: Error)
}
