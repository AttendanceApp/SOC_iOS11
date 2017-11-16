//
//  Utils.swift
//  Straight Outta Casti
//
//  Created by Drew Leary on 3/6/17.
//  Copyright © 2017 Attendance App. All rights reserved.
//

import Foundation
import UIKit

class Utils {
    // MARK: NSNotificationCenter Management
    
    class func registerNotificationWillEnterForeground(observer: AnyObject, selector: Selector) {
        // Handle when the app becomes active, going from the background to the foreground
        NotificationCenter.default.addObserver(observer, selector: selector, name: .UIApplicationWillEnterForeground, object: nil)
    }
    
    class func removeObserverForNotifications(observer: AnyObject) {
        NotificationCenter.default.removeObserver(observer)
    }
    
    class func showAlert(title: String, message: String, actions: [UIAlertAction], image: UIImage?, controller: UIViewController) {
        // set up the alert
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        if (image != nil) {
            let imageView = UIImageView(frame: CGRect(x: 3, y: 3, width: 40, height: 40))
            imageView.image = image
            alert.view.addSubview(imageView)
        }
        
        // add the actions
        for action in actions {
            alert.addAction(action)
        }
        
        // show the alert
        controller.present(alert, animated: true, completion: nil)
    }
    
}
