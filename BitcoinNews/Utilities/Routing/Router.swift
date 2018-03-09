//
//  Router.swift
//  BitcoinNews
//
//  Created by Alex Shcherbakov on 3/8/18.
//  Copyright © 2018 Oleks Shcherbakov. All rights reserved.
//

import Foundation
import UIKit

public enum NavigationType {
    case push
    case modal
}

public class Router {

    private let controllerFactory: ControllerFactory

    init(factory: ControllerFactory) {
        self.controllerFactory = factory
    }

    func navigate(to destination: Destination, presenter: Presenter, navigationType: NavigationType) {
        let controller = controllerFactory.controllerFor(destination: destination)
        presenter.present(controller: controller, navigationType: navigationType)
    }

}

public class ControllerFactory {
    private let resource: Resource

    init(resource: Resource) {
        self.resource = resource
    }

    func controllerFor(destination: Destination) -> Presenter {
        switch destination {
        case .feed: return createFeedController()
        }
    }

    func rootController() -> RootViewController {
        return RootViewController()
    }

    func initialController() -> UIViewController {
        return createFeedController() as! UIViewController
    }

    private func createFeedController() -> Presenter {
        let controller = FeedViewController()
        let viewModel = FeedViewModel(resource: resource, presenter: controller)
        controller.viewModel = viewModel
        return controller
    }

}
