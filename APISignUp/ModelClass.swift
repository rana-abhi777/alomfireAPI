//
//  ModelClass.swift
//  APISignUp
//
//  Created by Sierra 4 on 21/02/17.
//  Copyright © 2017 code-brew. All rights reserved.
//

import Foundation
import UIKit

class ModelClass {
    class func checkEmptyString(string: String) -> Bool {
        var result = Bool()
        if string.characters.count == 0 {
            result = true
        }
        else {
            result = false
        }
        return result
    }
    /*
    class func genericAlertMessage(theTitle: String, theMessage: String)
    {
        let alertController = UIAlertController(title: theTitle, message: theMessage, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        /*{
         (action: UIAlertAction) in print("pressed OK button");
         }*/
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
    */
    class func isValidEmail(testStr:String) -> Bool {
        // print("validate calendar: \(testStr)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    /////////////////////////////////////////phone number validation////////////////////////
    // function to validate the mobile number whether it's 10  digits or not
    class func validateMobileNo(value: String) -> Bool {
        let PHONE_REGEX = "^\\d{3}\\d{3}\\d{4}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: value)
        return result
    }
    ////////////////////////////first Name and Last Name Validation////////////////////////////////
    // function to validate first name and last name whether they contain text fields only or not
    class func isValidInputName(Input: String) -> Bool {
        let RegEx = "^[a-zA-Z]+$"
        let Test = NSPredicate(format:"SELF MATCHES %@", RegEx)
        return Test.evaluate(with: Input)
    }
    /////////////////////////////////////name validation ends///////////////////////////////////////////////////////

 
}
