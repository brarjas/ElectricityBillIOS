//
//  ElectricityViewController.swift
//  ElectricityBill
//
//  Created by MacStudent on 2018-08-08.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import UIKit

enum GenderSelect{
    case Male
    case Female
}

class ElectricityViewController: UIViewController {
    
    
    @IBOutlet weak var CustomerId: UITextField!
    
    @IBOutlet weak var CustomerName: UITextField!

    @IBOutlet weak var userEmailAddress: UITextField!
    
    @IBOutlet weak var BillDate: UITextField!
    
     @IBOutlet weak var UnitConsume: UITextField!
    
    @IBOutlet weak var Gender: UISegmentedControl!
    
    @IBOutlet weak var Male: UISegmentedControl!
    
    
    @IBOutlet weak var Female: UISegmentedControl!
    
    
    @IBOutlet weak var Calculatebtn: UIButton!
    
    private var datePicker: UIDatePicker?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action: #selector(ElectricityViewController.dateChanged(datePicker:)), for: .valueChanged)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ElectricityViewController.viewTapped(gestureRecognized:)))
        
        
       BillDate.inputView = datePicker
        
    
        // Do any additional setup after loading the view, typically from a nib.
    }
    @objc func viewTapped(gestureRecognized: UITapGestureRecognizer)
    {
        view.endEditing(true)
    }
    
    @objc func dateChanged(datePicker: UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        BillDate.text = dateFormatter.string(from: datePicker.date)
        view.endEditing(true)
        
    }
   
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    
    func genderSelected() -> GenderSelect {
        switch Gender.selectedSegmentIndex
        {
        case 0:
            return GenderSelect.Male
        case 1:
           return GenderSelect.Female
        default:
           return GenderSelect.Male
        }
        
    }
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    func isValidName(testStrr:String) -> Bool {
        let nameRegEx = "[A-Za-z ]{2,64}"
        
        let nameTest = NSPredicate(format:"SELF MATCHES %@", nameRegEx)
        return nameTest.evaluate(with: testStrr)
    }
    
    @IBAction func CalculateBill(_ sender: Any) {
        
        if (isValidEmail(testStr: userEmailAddress.text!) && (isValidName(testStrr: CustomerName.text!))){
        performSegue(withIdentifier: "BillDetails", sender: self)
    }
        else {
            let alert = UIAlertController(title: "Alert", message: "Wrong email or Name entered", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            
            // show the alert
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
//        if segue.identifier == "BillDetails" {
        
            let customerId = Int(self.CustomerId.text!)
            let customerName = self.CustomerName.text
            let userEmails = self.userEmailAddress.text
            let billDate = self.BillDate.text
            let unitConsume = Int(self.UnitConsume.text!)
            let gend = self.genderSelected()
            
            
        let eBill = Bill(custId: customerId!, custName: customerName!, userEmail: userEmails!, bilDate: billDate!, unitConsumed: unitConsume!, gender: gend, total: 0)
            
            let destinationVC = segue.destination as! BillDetailController
            destinationVC.bill1 = eBill
            

    }


}

public class Bill
{
    var custId: Int?
    var custName: String?
    var userEmail: String?
    var bilDate: String?
    var unitConsumed: Int?
    var gender: GenderSelect?
    var total: Double?
    
    
    init()
    {
        
        
    }
    
    init(custId: Int, custName: String, userEmail: String, bilDate: String, unitConsumed: Int, gender: GenderSelect, total: Double)
    {
        self.custId = custId
        self.custName = custName
        self.userEmail = userEmail
        self.bilDate = bilDate
        self.unitConsumed = unitConsumed
        self.gender = gender
        self.total = total
    }
}

