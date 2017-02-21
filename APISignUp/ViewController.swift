//
//  ViewController.swift
//  APISignUp
//
//  Created by Sierra 4 on 20/02/17.
//  Copyright © 2017 code-brew. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtUserName: UITextField!
    //email validator-------------------------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func btnSignInClick(_ sender: Any) {
        /*
        if (ModelClass.checkEmptyString(string: txtUserName.text!) || ModelClass.checkEmptyString(string: txtPassword.text!)) {
            ModelClass.genericAlertMessage(theTitle: "Error!!!", theMessage: "Cannot sign in because username or password is/are empty.")
        }
        */
    }
    

    
}

