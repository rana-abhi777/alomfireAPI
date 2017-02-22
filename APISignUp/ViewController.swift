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

    
    @IBOutlet weak var btnCheckBox: UIButton!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtUserName: UITextField!
    
    var printMessage = String()
    
    
    var name = String()
    var email = String()
    var password = String()
    var birthday = String()
    var phoneNumber = String()
    var country = String()
    var city = String()
    
    
    /*
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.txtUserName.resignFirstResponder()
        self.txtPassword.resignFirstResponder()
    }
    */
    
    func genericAlertMessage(theTitle: String, theMessage: String)
    {
        let alertController = UIAlertController(title: theTitle, message: theMessage, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //fetchData()
        
    }
    
    @IBAction func btnCheckBoxClick(_ sender: Any) {
        
    }
    @IBAction func btnSignInClick(_ sender: Any) {
        
        if (ModelClass.checkEmptyString(string: txtUserName.text!) || ModelClass.checkEmptyString(string: txtPassword.text!)) {
            genericAlertMessage(theTitle: "Error!!!", theMessage: "Cannot sign in because username or password is/are empty.")
        }
        fetchData()
        
    }
    
    func fetchData() {
        
        let param:[String:Any] = ["email": txtUserName.text!, "password": txtPassword.text!, "flag":"1"]
        
        ApiHandler.fetchData(urlStr: "login", parameters: param) { (jsonData) in
            // print(jsonData)
            let userModel = Mapper<User>().map(JSONObject: jsonData)
            
            print(userModel?.msg ?? "")
            print(userModel?.profile?.username ?? "")
            print(userModel?.profile?.phone ?? "")
            
            self.name = userModel?.profile?.username ?? "nil"
            self.email = userModel?.profile?.email ?? "nil"
            self.birthday = userModel?.profile?.birthday ?? "nil"
            self.city = userModel?.profile?.city ?? "nil"
            self.phoneNumber = userModel?.profile?.phone ?? "nil"
            self.country = userModel?.profile?.country ?? "nil"
            print(self.name)
            print(self.email)
            print(self.birthday)
            print(self.city)
            print(self.phoneNumber)
            print(self.country)
            self.performSegue(withIdentifier: "SignInSuccess", sender: self)
        }
        //self.prepare(for: SignInSuccessViewController, sender: self)
        //self.prepare(for: , sender: self)
        //self.performSegue(withIdentifier: "SignInSuccess", sender: self)
    }
    /*
    override func performSegue(withIdentifier identifier: String, sender: Any?) {
        if identifier == "SignInSuccess" {
            if let destination = segue.destination as? SignInSuccessViewController {
                destination.name = self.name
                destination.email = self.email
                destination.birthday = self.birthday
                destination.city = self.city
                destination.phoneNumber = self.phoneNumber
                destination.country = self.country
            }
        }
    }
    */
    ///*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SignInSuccess" {
            if let destination = segue.destination as? SignInSuccessViewController {
                destination.name = self.name
                destination.email = self.email
                destination.birthday = self.birthday
                destination.city = self.city
                destination.phoneNumber = self.phoneNumber
                destination.country = self.country
            }
        }
    //*/
    }
    
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SignInSuccess" {
            if let destination = segue.destination as? SignInSuccessViewController {
                destination.name = self.name
                destination.email = self.email
                destination.birthday = self.birthday
                destination.city = self.city
                destination.phoneNumber = self.phoneNumber
                destination.country = self.country
            }
        }
    }
 */
}
extension ViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.txtUserName.resignFirstResponder()
        self.txtPassword.resignFirstResponder()
    }
}
