//
//  Constants.swift
//  Straight Outta Casti
//
//  Created by Vanessa Woo on 2/17/17.
//  Copyright © 2017 Attendance App. All rights reserved.
//

import Foundation
import UserNotifications

class Constants {
    struct Geolocation {
        static let castiLatitude: Double = 37.4385029264143
        static let castiLongitude: Double = -122.151743983964
        static let deadband: Double = 0.001
    }
    
    struct GoogleForms {
        //add your strings for Google Forms here so that they're easy to access and change centrally
        //MARK: For Students
        static let firstNameEntryS: String = "entry.304670658="
        static let lastNameEntryS: String = "&entry.1819543685="
        static let inoroutEntryS: String = "&entry.1808342387="
        static let reasonEntryS: String = "&entry.1668998790="
        static let locationEntryS: String = "&entry.897415235="
        static let urlS: String = "https://docs.google.com/a/castilleja.org/forms/d/e/1FAIpQLSfdVxrppBDLSBQIUbHfYrvdUBIgOI7lRrIZits5K8ie8aac8g/formResponse"
        
        //MARK: For Teachers
        static let firstNameEntryT: String = "entry.188532641="
        static let lastNameEntryT: String = "&entry.1516486124="
        static let inoroutEntryT: String = "&entry.2061610398="
        static let reasonEntryT: String = "&entry.1855699008="
        static let locationEntryT: String = "&entry.160067402="
        static let urlT: String = "https://docs.google.com/a/castilleja.org/forms/d/e/1FAIpQLScd2OZxRNowVhrPWOG95r8zvvBV_TRPUUFA1JcZqCgBkxWr4g/formResponse"
        //"https://docs.google.com/a/castilleja.org/forms/d/e/1FAIpQLScd2OZxRNowVhrPWOG95r8zvvBV_TRPUUFA1JcZqCgBkxWr4g/formResponse"
        
        //MARK: Defaults
        static var inOrOut: String = "Out"
    }
    
    struct Remote {
        static let thisVersion = 1.1
        static var latestVersion = 1.1
    }
}
