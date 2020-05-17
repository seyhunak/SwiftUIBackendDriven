//
//  TmDbRepository.swift
//  SwiftUIBackend
//
//  Created by seyhunak on 07/05/20.
//  Copyright © 2020 seyhunak. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire

protocol ApiRepository {
    func getNotification() -> Observable<NotificationResult>
    func getFeaturedBooks() -> Observable<BookResult>
    func getTopBooks() -> Observable<BookResult>
    func getBooks() -> Observable<BookResult>
    func getGenreList() -> Observable<GenreResult>
}

struct ApiEndpoints {
    static let notification = "http://localhost:3000/notification"
    static let featuredBooks = "http://localhost:3000/featuredBooks"
    static let topBooks = "http://localhost:3000/topBooks"
    static let books = "http://localhost:3000/books"
    static let genres = "http://localhost:3000/genres"
}

class ApiRepositoryImpl: BaseRepository, ApiRepository {
    func getNotification() -> Observable<NotificationResult> {
        return super.createRequest(url: ApiEndpoints.notification)
    }

    func getFeaturedBooks() -> Observable<BookResult> {
        return super.createRequest(url: ApiEndpoints.featuredBooks)
    }

    func getTopBooks() -> Observable<BookResult> {
        return super.createRequest(url: ApiEndpoints.topBooks)
    }

    func getBooks() -> Observable<BookResult> {
        return super.createRequest(url: ApiEndpoints.books)
    }

    func getGenreList() -> Observable<GenreResult> {
        return super.createRequest(url: ApiEndpoints.genres)
    }
}
