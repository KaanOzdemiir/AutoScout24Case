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

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let frame = UIScreen.main.bounds
        window = UIWindow(frame: frame)
        window?.rootViewController = UINavigationController(rootViewController: CarFeedController())
        window?.makeKeyAndVisible()
        
        window?.makeKeyAndVisible()

        RemoteDataProvider.shared.request(for: CarRequest(headers: ["Content-Type":"application/json", "Accept": "application/json"])) { result in
            print(result)
        }
        
        print(Bundle.main.infoForKey(.apiHost))
        return true
    }

}

