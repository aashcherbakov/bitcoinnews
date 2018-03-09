//
//  FeedViewModel.swift
//  BitcoinNews
//
//  Created by Alex Shcherbakov on 3/8/18.
//  Copyright © 2018 Oleks Shcherbakov. All rights reserved.
//

import Foundation

public class FeedViewModel {

    private let feedPath = "https://cryptocurrencynews.com/feed/"
    private let resource: Resource
    private weak var presenter: Presenter?
    private var feed: Feed?
    private(set) var articleDisplays: [ArticleDisplay]?

    public enum State {
        case loading
        case complete
        case error
    }

    var onStateChange: ((State) -> Void)!

    init(resource: Resource, presenter: Presenter) {
        self.resource = resource
        self.presenter = presenter
    }

    public func loadFeed() {
        presenter?.showActivityIndicator()
        resource.getFeed(path: feedPath, completion: { [weak self] (feed, status) in
            self?.presenter?.hideActivityIndicator()
            
            guard let feed = feed else {
                self?.onStateChange(.error)
                return
            }

            self?.feed = feed
            self?.articleDisplays = self?.createArticleDisplays()
            self?.onStateChange(.complete)
        })
    }

    public func createArticleDisplays() -> [ArticleDisplay] {
        guard let feed = feed, let articles = feed.articles else {
            return []
        }

        return articles.map { article in
            return ArticleDisplay(
                title: article.title ?? "",
                date: article.date?.description ?? "",
                thumbnailImageUrl: article.imageURLs?.first)
        }
    }
}
