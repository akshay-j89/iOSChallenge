//
//  AppDelegate.swift
//  AkshayAssignment
//
//  Created by Akshay Jain on 01/12/20.
//  Copyright © 2020 Akshay Jain. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
            window = UIWindow(frame: UIScreen.main.bounds)
           let homeViewController = HomeViewController()
           homeViewController.view.backgroundColor = UIColor.white
           window!.rootViewController = homeViewController
           window!.makeKeyAndVisible()
        
        
//          window = UIWindow(frame: UIScreen.main.bounds)
//            let navController = UINavigationController()
//            let mainView = HomeViewController()
//            navController.viewControllers = [mainView]
//            self.window!.rootViewController = navController
//            self.window?.makeKeyAndVisible()
           return true
    }
    


  


}

