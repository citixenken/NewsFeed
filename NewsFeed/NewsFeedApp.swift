//
//  NewsFeedApp.swift
//  NewsFeed
//
//  Created by Ken Muyesu on 29/04/2022.
//

import SwiftUI

@main
struct NewsFeedApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
//                .environment(\.urlImageOptions, URLImageOptions(
//                                maxPixelSize: CGSize(width: 600.0, height: 600.0)
//                                ))
        }
    }
}
