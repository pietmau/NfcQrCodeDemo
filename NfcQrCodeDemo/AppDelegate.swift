//
//  AppDelegate.swift
//  NfcQrCodeDemo
//
//  Created by Maurizio Pietrantuono on 22/02/2018.
//  Copyright © 2018 Maurizio Pietrantuono. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        return true
    }

    func application(_ application: UIApplication, continue userActivity: NSUserActivity,
                     restorationHandler: @escaping ([Any]?) -> Void) -> Bool {
        guard let dynamicLinks = DynamicLinks.dynamicLinks() else {
            return false
        }
        let handled = dynamicLinks.handleUniversalLink(userActivity.webpageURL!) { (dynamiclink, error) in
            if let url = dynamiclink?.url {
                self.handleUrl(url: url)
            }
        }
        return handled
    }


    private func handleUrl(url url: URL) {
        let controller = self.window?.rootViewController as? BuzzbikeTabBarController
        controller!.onQrCodeUrlRetireved(url)
    }

    @available(iOS 9.0, *)
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey: Any]) -> Bool {
        return application(app, open: url,
                sourceApplication: options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String,
                annotation: "")
    }

    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        if let dynamicLink = DynamicLinks.dynamicLinks()?.dynamicLink(fromCustomSchemeURL: url) {
            return true
        }
        return false
    }
}


