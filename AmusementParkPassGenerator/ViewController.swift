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
    
    let info = ["firstName": "Kathy", "lastName": "Ebel", "streetAddress": "201 Pioneer Trail",
                "city": "Green Cove Springs", "state": "FL", "zipCode": "32043"]
    if let contactInfo: ContactInformation = ContactInformation(withDictionary: info) {
      let child = GuestType.freeChild(birthdate: "2014-10-09")
      let childPass = AccessPass(type: child)
      let verified = childPass.isVerified
      print(verified)
      print(childPass.allRideAccess)
    }
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

