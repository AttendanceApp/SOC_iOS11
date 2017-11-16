//
//  OutViewController.swift
//  Straight Outta Casti
//
//  Created by Vanessa Woo on 3/6/17.
//  Copyright © 2017 Attendance App. All rights reserved.
//

import UIKit

class OutViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: Setup and Variables
    var stateController: StateController!
    @IBOutlet weak var reason: UITextField!
    @IBOutlet weak var inOutLabel: UILabel!
    let inOutList: [String] = ["In", "Out"]
    let thumba = Thumba()
    var geofence: Geofence!
    let defaultOkAction = [UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)]
    
    @IBOutlet weak var doneButton: UIButton!
        
    override func viewDidLoad() {
        if geofence == nil {
            geofence = Geofence(deadband: Constants.Geolocation.deadband, targetLatitude: Constants.Geolocation.castiLatitude, targetLongitude: Constants.Geolocation.castiLongitude)
        }
        doneButton.isHidden = true
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        self.reason.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: IBActions
    @IBAction func done(_ sender: UIButton) {
        if (reason.text != nil && geofence.inCasti) {
            thumba.setupController()
            let account = self.stateController.get()
            let success: Bool = thumba.updateUI(firstName: account.firstName, lastName: account.lastName, reason: reason.text!, teacher: account.teacher)
            doneButton.isHidden = true
            if (success) {
            //present the alert
                Utils.showAlert(
                    title: "Sign " + Constants.GoogleForms.inOrOut + " Successful",
                    message: "Your sign " + Constants.GoogleForms.inOrOut + " was successful!",
                    actions: [
                        UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
                    ],
                    image: UIImage(named: "Checkmark"),
                    controller: self
                )
            } else {
                Utils.showAlert(title: "FAILURE!!!", message: "Something went wrong.", actions: [UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)], image: nil, controller: self)
            }
        } else if (!geofence.inCasti) {
            Utils.showAlert(title: "Sign Out Not Allowed", message: "You may not sign out if not on campus. Please email Ms. Magaña if you have left campus without signing out.", actions: defaultOkAction, image: nil, controller:self)
        } else {
            Utils.showAlert(title: "Empty Reason", message: "Please enter a reason to sign out.", actions: defaultOkAction, image: nil,controller:self)
        }
    }
    
    @IBAction func inOutSelected(_ sender: UISegmentedControl) {
        inOutLabel.text = "Sign " + inOutList[sender.selectedSegmentIndex]
        Constants.GoogleForms.inOrOut = inOutList[sender.selectedSegmentIndex]
    }

    
    //MARK: Keyboard Handling
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
        if reason.text != "" {
            doneButton.isHidden = false
        } else {
            doneButton.isHidden = true
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        dismissKeyboard()
        return false
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
