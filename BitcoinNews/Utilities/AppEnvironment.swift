//
//  AppEnvironment.swift
//  BitcoinNews
//
//  Created by Alex Shcherbakov on 3/8/18.
//  Copyright © 2018 Oleks Shcherbakov. All rights reserved.
//

import UIKit

public class AppEnvironment {
    private let controllerFactory: ControllerFactory
    private let resource: Resource = RemoteResource(parser: RSSParser())
    private weak var window: UIWindow?

    init() {
        controllerFactory = ControllerFactory(resource: resource)
    }

    public func run(in window: UIWindow?) {
        let rootController = RootViewController()
        let initialController = controllerFactory.initialController()
        rootController.display(initialController, completion: nil)

        self.window = window
        self.window?.rootViewController = rootController
        self.window?.makeKeyAndVisible()
    }

}
