//
//  ViewController.swift
//  CoreData Demo 1
//
//  Created by Nishant Rai on 25/11/18.
//  Copyright © 2018 Nishant Rai. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var txtMobile: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var txtName: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
    }

    @IBAction func saveButton(_ sender: UIButton) {
        let dict = ["name":txtName.text,"address":txtAddress.text,"mobile":txtMobile.text,"city":txtCity.text]
        
        DatabaseHelper.sharedInstance.save(object: dict as! [String : String])
        
    }
    
}

