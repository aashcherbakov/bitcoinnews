//
//  AppDelegate.swift
//  BitcoinNews
//
//  Created by Alex Shcherbakov on 2/14/18.
//  Copyright © 2018 Oleks Shcherbakov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var environment: AppEnvironment!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        environment = AppEnvironment()
        environment.run(in: window)

        return true
    }

}

