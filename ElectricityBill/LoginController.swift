//
//  LoginController.swift
//  ElectricityBill
//
//  Created by MacStudent on 2018-08-08.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    
    
    @IBOutlet weak var EmailAddress: UITextField!
    
    @IBOutlet weak var Password: UITextField!
    
    @IBOutlet weak var LoginBtn: UIButton!
    
    
    @IBOutlet weak var rememberMe: UISwitch!
    
    var userDefaults = UserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let emailtxt = userDefaults.value(forKey: "email"){
            if let passwordtxt = userDefaults.value(forKey: "password") {
                EmailAddress.text = emailtxt as? String
                Password.text = passwordtxt as? String
                
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        perform(#selector(self.LoginActn), with: nil)
        // Dispose of any resources that can be recreated.
    }

    @IBAction func LoginActn(_ sender: Any) {
        
        if ((EmailAddress.text?.contains("admin@123"))! && (Password.text?.contains("admin"))!)
        {
            if rememberMe.isOn{
                userDefaults.setValue(EmailAddress.text, forKey: "email")
                userDefaults.setValue(Password.text, forKey: "password")
            }else{
                userDefaults.removeObject(forKey: "email")
                userDefaults.removeObject(forKey: "password")
            }
            print("Login Successfully")
            performSegue(withIdentifier: "ElectricityBill", sender:self )
        
        }
        else {
            let alert = UIAlertController(title: "Alert", message: "Wrong email or password", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            
            // show the alert
            self.present(alert, animated: true, completion: nil)
        }
    }
}
