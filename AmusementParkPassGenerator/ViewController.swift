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
    let passGenerator = AccessPassGenerator.passGenerator // pass generator is responsible for creating all access passes and is a singleton
    let incorrectInfo = ["firstName": "Kathy", "lastName": "Ebel"] // cannot create ContactInformation that is invalid... an error will be printed
    let correctInfo = ["firstName": "Kathy", "lastName": "Ebel", "streetAddress": "201 Pioneer Trail",
                "city": "Green Cove Springs", "state": "FL", "zipCode": "32043"]
    let invalidBirthdate = "Jan 20, 20014" // preceding birthdate is not in correct format. Will print error to console when trying to create pass.
    let rideServicesEmployee = HourlyEmployeeType.rideServices(ContactInformation(withDictionary: correctInfo)!)
    let employeePass = passGenerator.createPass(forEntrant: rideServicesEmployee)
    print(employeePass.hasAccess(toArea: .rideControl)) // true
    print("Employee: \(employeePass.accessAreas)")
    let childPass = passGenerator.createPass(forEntrant: GuestType.freeChild(birthdate: "2010-10-07"))
    let child2 = passGenerator.createPass(forEntrant: GuestType.freeChild(birthdate: invalidBirthdate))
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

