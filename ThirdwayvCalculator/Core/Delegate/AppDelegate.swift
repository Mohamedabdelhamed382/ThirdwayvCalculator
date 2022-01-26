//
//  AppDelegate.swift
//  ThirdwayvCalculator
//
//  Created by MOHAMED ABD ELHAMED AHMED on 19/01/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var rootNavigationController: UINavigationController?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        configureRootViewController()
        return true
    }
    
    func configureRootViewController() {
        window = UIWindow(frame: UIScreen.main.bounds)
        let rootViewController = MathCalculatorViewController()
        rootNavigationController = UINavigationController(rootViewController: rootViewController)
        rootNavigationController?.setNavigationBarHidden(true, animated: false)
        window?.rootViewController = rootNavigationController
        window?.makeKeyAndVisible()
    }
    

}

