//
//  AppDelegate.swift
//  News-CleanCode
//
//  Created by Ravi navarro on 03/01/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.setColor()
        let window = UIWindow(frame: UIScreen.main.bounds)
        let navVC = UINavigationController(rootViewController: NewsRouter().viewController)
        window.rootViewController = navVC // Your initial view controller.
        navVC.navigationBar.prefersLargeTitles = true
        window.makeKeyAndVisible()
        self.window = window
        return true
    }
    
    //-----------------------------------------------------------------------
    //    MARK: Custom Methods
    //-----------------------------------------------------------------------
    
    private func setColor() {
        
        // ref:// stackoverflow.com/a/57152709/5588637
        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.backgroundColor = UIColor(displayP3Red: 47 / 255, green: 54 / 255, blue: 64 / 255, alpha: 1.0)
            UINavigationBar.appearance().standardAppearance = navBarAppearance
            UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        } else {
            UINavigationBar.appearance().barTintColor = UIColor(displayP3Red: 47 / 255, green: 54 / 255, blue: 64 / 255, alpha: 1.0)
            UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        }
    }
}

