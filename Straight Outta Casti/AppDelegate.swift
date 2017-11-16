//
//  AppDelegate.swift
//  Straight Outta Casti
//
//  Created by Vanessa Woo on 2/16/17.
//  Copyright © 2017 Attendance App. All rights reserved.
//

import UIKit
import UserNotifications
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    //MARK: Variables
    var window: UIWindow?
    
    let stateController = StateController(accountStorage: AccountStorage())
    let geofence: Geofence = Geofence(deadband: Constants.Geolocation.deadband, targetLatitude: Constants.Geolocation.castiLatitude, targetLongitude: Constants.Geolocation.castiLongitude)

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        //MARK: Configure Firebase
        FIRApp.configure()
        let _ = RCValues.sharedInstance
        //MARK: Starting ViewController
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        if Constants.Remote.latestVersion > Constants.Remote.thisVersion {
            let disabledController = storyboard.instantiateViewController(withIdentifier: "RemoteDisabledViewController") as! RemoteDisabledViewController
            self.window?.makeKeyAndVisible()
            self.window?.rootViewController = disabledController
        } else if !stateController.hasUserInfo() {
            let registerController = storyboard.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
            registerController.stateController = self.stateController
            self.window?.makeKeyAndVisible()
            self.window?.rootViewController = registerController
        } else {
            let signOutController = storyboard.instantiateViewController(withIdentifier: "OutViewController") as! OutViewController
            signOutController.stateController = self.stateController
            signOutController.geofence = self.geofence
            self.window?.makeKeyAndVisible()
            self.window?.rootViewController = signOutController
        }

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

