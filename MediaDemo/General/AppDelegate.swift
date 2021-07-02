//
//  AppDelegate.swift
//  MediaDemo
//
//  Created by Ali Tarek on 7/1/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate
{
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
    {
        if let rootNavigationController = application.windows.first?.rootViewController as? UINavigationController,
            let homeView = rootNavigationController.viewControllers.first as? HomeViewController
        {
            HomeBuilder.buildModule(arroundView: homeView)
        }
        
        return true
    }

}

