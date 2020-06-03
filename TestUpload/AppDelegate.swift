//
//  AppDelegate.swift
//  TestUpload
//
//  Created by thomasdao on 6/3/20.
//  Copyright © 2020 Test. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        startFirebase()
        return true
    }
    
    func startFirebase() {
        let filePath = Bundle.main.path(forResource: "GoogleService-Info", ofType: "plist")
        guard let fileopts = FirebaseOptions(contentsOfFile: filePath!) else {
            assert(false, "Couldn't load config file")
            return
        }
        FirebaseApp.configure(options: fileopts)
    }
}

