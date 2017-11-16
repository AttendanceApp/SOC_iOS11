//
//  GoogleFormsConnection.swift
//  Straight Outta Casti
//
//  Created by Liz Parker on 3/2/17.
//  Copyright © 2017 Attendance App. All rights reserved.
//

import Foundation
import UIKit

class GoogleFormsConnection {
    
    
    static func doMyBidNiss(firstName: String, lastName: String, reason: String, teacher: Bool) {
        
        var myURL: NSURL!
        var namesString: String!
        var outString: String!
        var reasonString: String!
        var fieldsToPost: NSString!
        var locationString: String!
        let session = URLSession(configuration: URLSessionConfiguration.default)
        if teacher {
            myURL = NSURL(string: Constants.GoogleForms.urlT)
            namesString = Constants.GoogleForms.firstNameEntryT + firstName + Constants.GoogleForms.lastNameEntryT + lastName
            outString = Constants.GoogleForms.inoroutEntryT + Constants.GoogleForms.inOrOut
            locationString =  Constants.GoogleForms.locationEntryT + "Straight Outta Casti"
            reasonString = Constants.GoogleForms.reasonEntryT + reason
        } else {
            myURL = NSURL(string: Constants.GoogleForms.urlS)
            namesString = Constants.GoogleForms.firstNameEntryS + firstName + Constants.GoogleForms.lastNameEntryS + lastName
            outString = Constants.GoogleForms.inoroutEntryS + Constants.GoogleForms.inOrOut
            reasonString = Constants.GoogleForms.reasonEntryS + reason
            locationString =  Constants.GoogleForms.locationEntryS + "Straight Outta Casti"
        }
        fieldsToPost = namesString! + outString! + reasonString! + locationString! as NSString
        var request = URLRequest(url:myURL! as URL)
        request.httpMethod = "POST"
        
        request.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
        
        request.httpBody = fieldsToPost.data(using: String.Encoding.utf8.rawValue)
        
        let task = session.dataTask(with: request as URLRequest) {
            (data, response, error) in
            let strData = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            print(strData)
            print(error)
            print(response)
            print(myURL)
        }
        task.resume()
    }
    
    
}
