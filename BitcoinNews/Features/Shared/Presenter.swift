//
//  Presenter.swift
//  BitcoinNews
//
//  Created by Alex Shcherbakov on 3/8/18.
//  Copyright © 2018 Oleks Shcherbakov. All rights reserved.
//

import Foundation

public protocol Presenter: class {

    func showActivityIndicator()
    func hideActivityIndicator()
    func present(controller: Presenter, navigationType: NavigationType)

}
