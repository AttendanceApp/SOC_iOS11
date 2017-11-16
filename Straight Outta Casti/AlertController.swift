//
//  AlertController.swift
//  Straight Outta Casti
//
//  Created by Liz Parker on 3/29/17.
//  Copyright © 2017 Attendance App. All rights reserved.
//

import Foundation
import UIKit

class AlertController: UIViewController {

        
        // create the alert
        let alert = UIAlertController(title: "UIAlertController", message: "Would you like to continue learning how to use iOS alerts?", preferredStyle: UIAlertControllerStyle.alert)
        
        // add the actions (buttons)
        alert.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.default, handler: nil))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)

}
