//
//  GenreResult.swift
//  SwiftUIBackend
//
//  Created by seyhunak on 07/05/20.
//  Copyright © 2020 seyhunak. All rights reserved.
//

import Foundation

struct GenreResult: Codable {
    var results: [Genre]
    let title: String?
}

struct Genre: Codable {
    let id: String
    let name: String
}
