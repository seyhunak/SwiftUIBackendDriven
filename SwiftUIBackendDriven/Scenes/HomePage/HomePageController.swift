//
//  HomePageController.swift
//  SwiftUIBackend
//
//  Created by seyhunak on 07/05/20.
//  Copyright © 2020 seyhunak. All rights reserved.
//

import Foundation
import RxSwift

class HomePageController: ObservableObject {
    
    @Published
    var uiComponents: [UIComponent] = []
    let disposableBag = DisposeBag()
    let repository: ApiRepository = ApiRepositoryImpl()
    var components: [UIComponent] = []

    func loadPage() {
        uiComponents = []
        Observable
            .zip(repository.getNotification(),
                 repository.getFeaturedBooks(),
                 repository.getTopBooks(),
                 repository.getBooks(),
                 repository.getGenreList(),
                 resultSelector: { (notificationResult, featuredBooksResult, topBooksResult, booksResult, genresResult) in
                    var homePage = HomePage(
                        notificationResult: notificationResult,
                        featuredBooksResult: featuredBooksResult,
                        topBooksResult: topBooksResult,
                        booksResult: booksResult,
                        genresResult: genresResult
                    )
                    return homePage.buildComponents()
            })
            .subscribe(
                onNext: { [weak self] components in
                    self?.uiComponents = components
                },
                onError: { error in
                    debugPrint(error)
            }
        )
        .disposed(by: disposableBag)
    }

    func removeComponent(id: String) {
        uiComponents = uiComponents.filter() { component in
            component.uniqueId != id
        }
    }
}
