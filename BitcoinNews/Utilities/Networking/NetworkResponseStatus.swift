//
//  NetworkResponseStatus.swift
//  BitcoinNews
//
//  Created by Alex Shcherbakov on 3/8/18.
//  Copyright © 2018 Oleks Shcherbakov. All rights reserved.
//

import Foundation

public enum NetworkResponseStatus {
    case success
    case error(string: String?)
}
