//
//  AppDelegate.swift
//  AutoScout24Case
//
//  Created by Kaan Ozdemir on 12.03.2023.
//

import UIKit
import RemoteDataProvider

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    private var appNavigator = AppNavigator()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let frame = UIScreen.main.bounds
        window = UIWindow(frame: frame)
        appNavigator.navigate()
        return true
    }

}

