//
//  ViewController.swift
//  AmusementParkPassGenerator
//
//  Created by Katherine Ebel on 11/3/16.
//  Copyright © 2016 Katherine Ebel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    let passGenerator = AccessPassGenerator.passGenerator
    //let incorrectInfo = ["firstName": "Kathy", "lastName": "Ebel"]
    let info = ["firstName": "Kathy", "lastName": "Ebel", "streetAddress": "201 Pioneer Trail",
                "city": "Green Cove Springs", "state": "FL", "zipCode": "32043"]
    // let badInfo = ContactInformation(withDictionary: incorrectInfo)
    // let invalidBirthdate = "2009-10-07"
    let contactInfo = ContactInformation(withDictionary: info)!
    let employee = HourlyEmployeeType.rideServices(contactInfo)
    let employeePass = passGenerator.createPass(forEntrant: employee)
    print(employeePass.foodDiscount)
    let hourly = employee.contactInformation
    print(hourly)
  
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

