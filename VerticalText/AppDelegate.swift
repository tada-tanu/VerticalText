//
//  AppDelegate.swift
//  VerticalText
//
//  Created by Yuji Tada on 2023/08/07.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        let rootViewController = RootViewController()
        window?.rootViewController = rootViewController.wrapNavigationController()
        window?.makeKeyAndVisible()
        return true
    }
}

