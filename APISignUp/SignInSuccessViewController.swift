//
//  SignInSuccessViewController.swift
//  APISignUp
//
//  Created by Sierra 4 on 22/02/17.
//  Copyright © 2017 code-brew. All rights reserved.
//

import UIKit

class SignInSuccessViewController: UIViewController {
    
    @IBOutlet weak var lblNameDisplay: UILabel!
    @IBOutlet weak var lblEmailDisplay: UILabel!
    @IBOutlet weak var lblBirthdayDisplay: UILabel!
    @IBOutlet weak var lblPhoneNumberDisplay: UILabel!
    @IBOutlet weak var lblCountryDisplay: UILabel!
    @IBOutlet weak var lblCityDisplay: UILabel!
    
    var name = String()
    var email = String()
    var birthday = String()
    var phoneNumber = String()
    var country = String()
    var city = String()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(name)
        print(email)
        print(birthday)
        print(phoneNumber)
        print(country)
        print(city)
        lblNameDisplay.text = "\(name)"
        lblEmailDisplay.text = "\(email)"
        lblBirthdayDisplay.text = "\(birthday)"
        lblPhoneNumberDisplay.text = "\(phoneNumber)"
        lblCountryDisplay.text = "\(country)"
        lblCityDisplay.text = city
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func btnBackClick(_ sender: Any) {
            _ = navigationController?.popViewController(animated: true)
    }
}
