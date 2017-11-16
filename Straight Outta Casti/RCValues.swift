//
//  RCValues.swift
//  Straight Outta Casti
//
//  Created by Vanessa Woo on 4/7/17.
//  Copyright © 2017 Attendance App. All rights reserved.
//

import Foundation
import Firebase

class RCValues {
    
    static let sharedInstance = RCValues()
    
    private init () {
        loadDefaultValues()
        fetchCloudValues()
    }
    
    func loadDefaultValues() {
        let appDefaults: [String: NSObject] = [
            "version" : 1.0 as NSObject
        ]
        FIRRemoteConfig.remoteConfig().setDefaults(appDefaults)
    }
    
    func fetchCloudValues() {
        let fetchDuration: TimeInterval = 300
        FIRRemoteConfig.remoteConfig().fetch(withExpirationDuration: fetchDuration) {
            [weak self] (status, error) in
            
            guard error == nil else {
                print ("Uh-oh. Got an error fetching remote values \(error)")
                return
            }
            
            FIRRemoteConfig.remoteConfig().activateFetched()
            print ("Retrieved values from the cloud!")
            Constants.Remote.latestVersion = FIRRemoteConfig.remoteConfig().configValue(forKey: "version").numberValue as! Double
        }
    }
    
    
    func activateDebugMode() {
        let debugSettings = FIRRemoteConfigSettings(developerModeEnabled: true)
        FIRRemoteConfig.remoteConfig().configSettings = debugSettings!
    }
    
}
