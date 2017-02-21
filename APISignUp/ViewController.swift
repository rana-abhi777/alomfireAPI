//
//  ViewController.swift
//  APISignUp
//
//  Created by Sierra 4 on 20/02/17.
//  Copyright © 2017 code-brew. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper


class ViewController: UIViewController {

    
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtUserName: UITextField!
    
    func genericAlertMessage(theTitle: String, theMessage: String)
    {
        let alertController = UIAlertController(title: theTitle, message: theMessage, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        /*{
         (action: UIAlertAction) in print("pressed OK button");
         }*/
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        txtUserName.delegate = self
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func btnSignInClick(_ sender: Any) {
        
        if (ModelClass.checkEmptyString(string: txtUserName.text!) || ModelClass.checkEmptyString(string: txtPassword.text!)) {
            genericAlertMessage(theTitle: "Error!!!", theMessage: "Cannot sign in because username or password is/are empty.")
        }
        
    }
}
extension ViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
