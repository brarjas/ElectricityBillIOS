//
//  BillDetailController.swift
//  ElectricityBill
//
//  Created by MacStudent on 2018-08-08.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import UIKit

class BillDetailController: UIViewController {

    @IBOutlet weak var CustId1: UILabel!

    @IBOutlet weak var CustName1: UILabel!
    
    @IBOutlet weak var EmailAddress1: UILabel!
    
   
    @IBOutlet weak var BilDate1: UILabel!
    
    @IBOutlet weak var UnitConsumed1: UILabel!
    
    
    
   
    @IBOutlet weak var gender1: UILabel!
    
    @IBOutlet weak var TotalBill1: UILabel!
    
//    var string1: Int?
//    var string2: String?
//    var string3: String?
//    var string4: Int?
//    var string5: Int?
    
    var bill1: Bill?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        CustId1.text = "\(bill1?.custId ?? 0)" // "\(String(describing: bill1?.custId!))"
        CustName1.text = "\(bill1?.custName ?? "")"
        EmailAddress1.text = "\(bill1?.userEmail ?? "")"
        BilDate1.text = "\(bill1?.bilDate ?? "")"
        UnitConsumed1.text = "\(bill1?.unitConsumed ?? 0)"
        gender1.text = "\(bill1?.gender ?? GenderSelect.Male)"
        TotalBill1.text = "\(calTotal(units: (bill1?.unitConsumed!)!))"
        // Do any additional setup after loading the view, typically from a nib.
    }
    func calTotal(units: Int) -> Double{
        switch units {
        case 0...100:
            return (Double(units) * 0.75)
        case 101...250:
            return (100 * 0.75) + (Double(units-100) * 1.25)
        case 251...450:
            return ((100 * 0.75) + (150 * 1.25 + (Double(units-250) * 1.75)))
        default:
            return (612.5 + Double(units-450) * 2.25)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}
