//
//  RemoteResource.swift
//  BitcoinNews
//
//  Created by Alex Shcherbakov on 3/7/18.
//  Copyright © 2018 Oleks Shcherbakov. All rights reserved.
//

import Foundation
import AlamofireRSSParser

public protocol Resource {

    func getFeed(path: String, completion: @escaping (Feed?, NetworkResponseStatus) -> Void)

}

public class RemoteResource: Resource {

    private let rssParser: RSSParser
    private let feedConverter = FeedConverter()

    init(parser: RSSParser) {
        self.rssParser = parser
    }

    public func getFeed(path: String, completion: @escaping (Feed?, NetworkResponseStatus) -> Void) {
        rssParser.getRSSFeedRespons(path: path) { (feed, status) in
            guard let feed = feed else {
                completion(nil, .error(string: "No feed"))
                return
            }

            let convertedFeed = self.feedConverter.transform(feed: feed)
            completion(convertedFeed, status)
        }
    }

}


