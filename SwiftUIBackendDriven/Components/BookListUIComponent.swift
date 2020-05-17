//
//  BookListUIComponent.swift
//  SwiftUIBackend
//
//  Created by SEYHUN AKYÜREK on 16.05.2020.
//  Copyright © 2020 seyhunak. All rights reserved.
//

import Foundation
import SwiftUI
import KingfisherSwiftUI

class BookListUIComponent : UIComponent {
    let bookResult: BookResult
    var uniqueId: String

    init(bookResult: BookResult) {
        self.bookResult = bookResult
        self.uniqueId = bookResult.title ?? "Books"
    }

    func render(uiDelegate: UIDelegate) -> AnyView {
        return BookListView(bookResult: bookResult).toAny()
    }
}

struct BookListView: View {
    let bookResult: BookResult
    var body: some View {
        VStack {
            HStack {
                Text(bookResult.title ?? "Books")
                    .font(.headline)
                Spacer()
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(bookResult.results, id: \.title) { book in
                      BookView(book: book)
                    }
                }
            }
        }
        .padding()
    }
}

struct BookView: View {
    let book: Book
    var body: some View {
        VStack {
            KFImage(URL(string: book.thumbnailUrl ?? "http://placeimg.com/640/480/book"))
                .resizable()
                .frame(width: CGFloat(book.width), height: CGFloat(book.height))
                .cornerRadius(10)
            Text(book.title)
                .frame(width: CGFloat(book.width), alignment: Alignment.leading)
                .foregroundColor(.black)
                .lineLimit(2)
        }
    }
}


struct BookView_Previews: PreviewProvider {
    static var previews: some View {
        BookView(book: Book(
            title: "", isbn: "", pageCount: 1, publishedDate: PublishedDate(date: ""), thumbnailUrl: "", shortDescription: "", longDescription: "",
            status: "", authors: [""], categories: [""])
        )
    }
}
