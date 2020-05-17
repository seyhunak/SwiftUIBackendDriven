//
//  HomePage.swift
//  SwiftUIBackend
//
//  Created by SEYHUN AKYÜREK on 16.05.2020.
//  Copyright © 2020 seyhunak. All rights reserved.
//

import Foundation

struct HomePage {
    let notificationResult: NotificationResult, featuredBooksResult: BookResult, topBooksResult: BookResult, booksResult: BookResult, genresResult: GenreResult
    var components: [UIComponent] = []

    init(notificationResult: NotificationResult,
         featuredBooksResult: BookResult,
         topBooksResult: BookResult,
         booksResult: BookResult,
         genresResult: GenreResult) {
        self.notificationResult = notificationResult
        self.featuredBooksResult = featuredBooksResult
        self.topBooksResult = topBooksResult
        self.booksResult = booksResult
        self.genresResult = genresResult
    }

    private mutating func prepareComponents() {
        buildNotification()
        buildGenreListComponent()
        buildFeatureBooks()
        buildTopBooks()
        buildBooks()
    }

    public mutating func buildComponents() -> [UIComponent] {
        self.prepareComponents()
        return components
    }

    private mutating func buildNotification() {
        components.append(NotificationComponent(uniqueId: notificationResult.id,
            model: NotificationUIModel(
                message: notificationResult.message,
                actionText: notificationResult.actionText)
            )
        )
    }

    private mutating func buildFeatureBooks() {
        components.append(BookListUIComponent(bookResult: BookResult(results: featuredBooksResult.results, title: "Feature Books")))
    }

    private mutating func buildTopBooks() {
        components.append(BookListUIComponent(bookResult: BookResult(results: topBooksResult.results, title: "Top Books")))
    }

    private mutating func buildBooks() {
        components.append(BookListUIComponent(bookResult: BookResult(results: booksResult.results, title: "All Books")))
    }

    private mutating func buildGenreListComponent() {
        components.append(GenreListComponent(genres: genresResult.results, uniqueId: "All Genres"))
    }
}
