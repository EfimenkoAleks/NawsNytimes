//
//  AppDelegate.swift
//  NewsNytimes
//
//  Created by user on 06.09.2021.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let module = SplashWireFrame.create()
        let navigation = UINavigationController(rootViewController: module)
        self.window?.rootViewController = navigation
        self.window?.makeKeyAndVisible()
        return true
    }
}

