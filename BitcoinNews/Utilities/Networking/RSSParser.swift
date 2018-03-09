//
//  RSSParser.swift
//  BitcoinNews
//
//  Created by Alex Shcherbakov on 3/7/18.
//  Copyright © 2018 Oleks Shcherbakov. All rights reserved.
//

import Alamofire
import AlamofireRSSParser

public class RSSParser {

    public func getRSSFeedRespons(
        path: String,
        completionHandler: @escaping (_ response: RSSFeed?, _ status: NetworkResponseStatus) -> Void)
    {
        Alamofire.request(path).responseRSS() { response in
            if let rssFeedXML = response.result.value {
                completionHandler(rssFeedXML, .success)
            } else {
                completionHandler(nil, .error(string: response.result.error?.localizedDescription))
            }
        }
    }

}
