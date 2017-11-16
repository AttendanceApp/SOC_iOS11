//
//  Notification.swift
//  Straight Outta Casti
//
//  Created by Vanessa Woo on 3/27/17.
//  Copyright © 2017 Attendance App. All rights reserved.
//

import Foundation
import UserNotifications

class Notification: NSObject {
    
    let center = Constants.Notifications.center
    let options = Constants.Notifications.options
    let content = Constants.Notifications.content
    var stateController: StateController!
    var timer: Timer?
    
    init (stateController: StateController) {
        self.stateController = stateController
    }
    
    func requestAuth() {
        center.requestAuthorization(options: options) { (granted, error) in
            if granted {
                self.stateController.allowNotifications = true
            } else {
                self.stateController.allowNotifications = false
            }
        }
    }
    
    func getSettings() {
        center.getNotificationSettings { (settings) in
            if settings.authorizationStatus == .authorized {
                self.stateController.allowNotifications = true
            } else {
                self.stateController.allowNotifications = false
            }
        }
    }
    
    func setNotification(trigger: UNNotificationTrigger) {
        timer = Timer.scheduledTimer(timeInterval: 300, target: self, selector: #selector(updateDate), userInfo: nil, repeats: true)
        if (self.stateController.wantNotifications) {
            content.title = "Don't forget to sign in! :)"
            content.body = "Welcome back to campus."
            content.sound = UNNotificationSound.default()
            let identifier = "UYLLocalNotification"
            let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
            center.add(request, withCompletionHandler: { (error) in
                if let error = error {
                    print (error)
                }
            })
        }
    }
    
    func updateDate() {
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        if (hour >= 15 && minute >= 15) {
            center.removeAllPendingNotificationRequests()
        }
    }
    
    deinit {
        if let timer = self.timer {
            timer.invalidate()
        }
    }
}
