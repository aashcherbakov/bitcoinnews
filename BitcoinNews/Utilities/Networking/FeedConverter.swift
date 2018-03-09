//
//  FeedConverter.swift
//  BitcoinNews
//
//  Created by Alex Shcherbakov on 3/8/18.
//  Copyright © 2018 Oleks Shcherbakov. All rights reserved.
//

import Foundation
import AlamofireRSSParser

public struct FeedConverter {

    public func transform(feed: RSSFeed?) -> Feed? {
        guard let feed = feed else {
            return nil
        }

        let articles = transform(rssItems: feed.items)
        return Feed(title: feed.title, description: feed.feedDescription, articles: articles)
    }

    private func transform(rssItems: [RSSItem]) -> [Article] {
        let articles = rssItems.map { Article(title: $0.title, link: $0.link, date: $0.pubDate, imageURLs: $0.imagesFromDescription) }
        return articles
    }

}
