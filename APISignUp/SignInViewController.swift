//
//  SignInViewController.swift
//  APISignUp
//
//  Created by Sierra 4 on 21/02/17.
//  Copyright © 2017 code-brew. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

class SignInViewController: UIViewController {

    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtPhoneNumber: UITextField!
    @IBOutlet weak var txtCountry: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    
    @IBOutlet weak var btnSignUpNext: UIButton!
    
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
    /*
    func fetchData() {
        
        let param:[String:Any] = ["username": txtName.text ?? "",
                                  "email" : txtEmail.text ?? "",
                                  "password" : txtPassword.text ?? "",
                                  "phone" : txtPhoneNumber.text ?? "",
                                  "country" : txtCountry.text ?? "",
                                  "city" : txtCity.text ?? "",
                                  "address" : txtAddress.text ?? "",
                                  "flag" : 1,
                                  "birthday" : "10/11/1995",
                                  "country_code" : "91",
                                  "postal_code" : "160047",
                                  "country_iso3" : "IND",
                                  "state" : "Himachal Pradesh"]

        
        ApiHandler.fetchData(urlStr: "login", parameters: param) { (jsonData) in
            // print(jsonData)
            let userModel = Mapper<User>().map(JSONObject: jsonData)
            
            print(userModel?.msg ?? "")
            print(userModel?.profile?.username ?? "")
            print(userModel?.profile?.phone ?? "")
            

        }
    }
    */
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        btnSignUpNext.layer.cornerRadius = 17.5
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnClickNext(_ sender: Any) {
        if ((ModelClass.checkEmptyString(string: txtName.text!)) || (ModelClass.checkEmptyString(string: txtEmail.text!)) || (ModelClass.checkEmptyString(string: txtPassword.text!)) || (ModelClass.checkEmptyString(string: txtPhoneNumber.text!)) || (ModelClass.checkEmptyString(string: txtCountry.text!)) || (ModelClass.checkEmptyString(string: txtCity.text!)) || (ModelClass.checkEmptyString(string: txtAddress.text!)) ) {
            genericAlertMessage(theTitle: "Alert!", theMessage: "Field/Fields are empty.")
        }
        if (!(ModelClass.isValidInputName(Input: txtName.text!))) {
            genericAlertMessage(theTitle: "Error!", theMessage: "Other than character in name")
        }
        if (!(ModelClass.isValidEmail(testStr: txtEmail.text!))) {
            genericAlertMessage(theTitle: "Error!", theMessage: "Invalid email id.")
        }
        if ((txtPassword.text?.characters.count)! < 5) {
            genericAlertMessage(theTitle: "Alert!", theMessage: "Password cannot be less than 5 characters.")
        }
        if (!(ModelClass.validateMobileNo(value: txtPhoneNumber.text!))) {
            genericAlertMessage(theTitle: "Error!", theMessage: "Other than digits in phonenumber field.")
        }
        //fetchData()
        
        let param : [String : Any] = ["username": txtName.text ?? "",
                                       "email" : txtEmail.text ?? "",
                                       "password" : txtPassword.text ?? "",
                                       "phone" : txtPhoneNumber.text ?? "",
                                       "country" : txtCountry.text ?? "",
                                       "city" : txtCity.text ?? "",
                                       "address" : txtAddress.text ?? "",
                                       "flag" : 1,
                                       "birthday" : "10/11/1995",
                                       "country_code" : "91",
                                       "postal_code" : "160047",
                                       "country_iso3" : "INDIA",
                                       "state" : "Himachal Pradesh"]
            ApiHandler.fetchData(urlStr: "signup", parameters: param) { (jsonData) in
                _ = Mapper<User>().map(JSONObject : jsonData)
                print("Successfully added")
        }
 
    }
}
extension SignInViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.txtName.resignFirstResponder()
        self.txtEmail.resignFirstResponder()
        self.txtPassword.resignFirstResponder()
        self.txtPhoneNumber.resignFirstResponder()
        self.txtCountry.resignFirstResponder()
        self.txtCity.resignFirstResponder()
        self.txtAddress.resignFirstResponder()
    }
    
}
