//
//  Book.swift
//  SwiftUIBackend
//
//  Created by SEYHUN AKYÜREK on 16.05.2020.
//  Copyright © 2020 seyhunak. All rights reserved.
//

import Foundation

struct BookResult: Codable {
    var results: [Book]
    let title: String?
}

struct Book: Codable {
    let title: String
    let isbn: String?
    let pageCount: Int?
    let publishedDate: PublishedDate?
    let thumbnailUrl: String?
    let shortDescription: String?
    let longDescription: String?
    let status: String?
    let authors, categories: [String]
    let width: Int = 180
    let height: Int = 220
}

struct PublishedDate: Codable {
    let date: String?

    private enum CodingKeys: String, CodingKey {
      case date = "$date"
    }
}

enum Status: String {
    case meap
    case publish
}
