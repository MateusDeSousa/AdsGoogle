//
//  AppDelegate.swift
//  ExampleNative
//
//  Created by Mateus Sousa on 18/04/20.
//  Copyright © 2020 MateusSousa. All rights reserved.
//

import UIKit
import AdsGoogle

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        AdsNativeManager.instance.setup(idNative: "ca-app-pub-3940256099942544/2521693316")

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = ViewController()
        window?.makeKeyAndVisible()
        
        return true
    }
}
