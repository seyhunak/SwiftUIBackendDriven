//
//  GenreListComponent.swift
//  SwiftUIBackend
//
//  Created by seyhunak on 07/05/20.
//  Copyright © 2020 seyhunak. All rights reserved.
//

import Foundation
import SwiftUI

struct GenreListComponent: UIComponent {
    let genres: [Genre]
    var uniqueId: String

    func render(uiDelegate: UIDelegate) -> AnyView {
        GenreListView(genres: genres).toAny()
    }
}

struct GenreListView: View {
    let genres: [Genre]
    var body: some View {
        VStack {
            HStack {
                Text("Genres")
                Spacer()
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(genres, id: \.id) { genre in
                        GenreView(genre: genre)
                    }
                }
            }
        }
        .padding()
    }
}

struct GenreView: View {
    let genre: Genre
    var body: some View {
        Text(genre.name)
            .foregroundColor(Color.white)
            .padding(.all)
            .background(Color.black)
            .border(Color.black, width: 2)
            .cornerRadius(20)
    }
}


struct Genre_Preview: PreviewProvider {
    static var previews: some View {
        GenreView(genre: Genre(id: "12", name: "Action"))
    }
}
