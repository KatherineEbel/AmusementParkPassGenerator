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
    
    
     // Stubs for testing GuestTypes
     /*
     let classicGuest = passGenerator.createPass(forEntrant: GuestType.classic)
     print(classicGuest.type.accessAreas)
     print(classicGuest.allRideAccess)
     print(classicGuest.skipsQueues)
     */
     /*
     let vipGuest = passGenerator.createPass(forEntrant: GuestType.VIP)
     print(vipGuest.accessAreas)
     print(vipGuest.hasAccess(toArea: .kitchen))
     print(vipGuest.allRideAccess)
     print(vipGuest.skipsQueues)
    */
    /*
    let badDateFormat = "12-25-2014"
    let goodDateFormat = "2014-25-12"
    let tooOld = "2009-10-07"
    let badDateFormatPass = passGenerator.createPass(forEntrant: GuestType.freeChild(birthdate: badDateFormat)) // should throw error for invalid date format
    let tooOldPass = passGenerator.createPass(forEntrant: GuestType.freeChild(birthdate: tooOld)) // should throw fails age requirement error
    let validChildPass = passGenerator.createPass(forEntrant: GuestType.freeChild(birthdate: goodDateFormat))
    print(validChildPass.accessAreas)
    print(validChildPass.allRideAccess)
    print(validChildPass.skipsQueues)
    print(validChildPass.foodDiscount)
    print(validChildPass.merchandiseDiscount)
    */
    
    
    // info for testing employee and manager contact information
    let correctInfo = ["firstName": "John", "lastName": "Doe", "streetAddress": "123 Wonder Road",
                "city": "Somewhere Out there", "state": "FL", "zipCode": "90210"]
    let contactInfo = ContactInformation(withDictionary: correctInfo)! // force unwrapping since I know it contains correct values
    /*
    let incorrectInfo = ["firstName": "Kathy", "lastName": "Ebel"]
    let failingInfo = ContactInformation(withDictionary: incorrectInfo) // cannot create contact info if dictionary doesn't have correct values
    // Test all Employee types
    if let goodInfo = failingInfo {
      let failingPass = passGenerator.createPass(forEntrant: HourlyEmployeeType.rideServices(goodInfo))
      print(failingPass.contactInfo!)
    } else {
        print("Info was bad pass not created")
    }
    // Test Ride Services pass
    let successFullInfo = ContactInformation(withDictionary: correctInfo)!
    let rideServicesPass = passGenerator.createPass(forEntrant: HourlyEmployeeType.rideServices(successFullInfo))
    print(rideServicesPass.hasAccess(toArea: .rideControl)) // true
    print(rideServicesPass.accessAreas)
    print(rideServicesPass.contactInfo!) // contact info is optional since not all types have contact info
    print(rideServicesPass.foodDiscount)
    print(rideServicesPass.merchandiseDiscount)
    print(rideServicesPass.skipsQueues)
    print(rideServicesPass.hasAccess(toArea: .kitchen)) // should be false
    */
    /* Test fooodServices pass
    let foodServicesPass = passGenerator.createPass(forEntrant: HourlyEmployeeType.foodServices(contactInfo))
    print(foodServicesPass.hasAccess(toArea: .kitchen)) // true
    print(foodServicesPass.hasAccess(toArea: .maintenance)) // false
    if let info = foodServicesPass.contactInfo {
      print(info)
    }
    print(foodServicesPass.skipsQueues) // false
    */
    
    /*  // Test maintenance pass
    let maintenancePass = passGenerator.createPass(forEntrant: HourlyEmployeeType.maintenance(contactInfo))
    print(maintenancePass.foodDiscount) // 15
    print(maintenancePass.merchandiseDiscount) // 25
    print(maintenancePass.hasAccess(toArea: .maintenance)) //true
    print(maintenancePass.hasAccess(toArea: .office)) // false
    print(maintenancePass.skipsQueues)
    */
    
    /* // Test Manager Pass
     
    let managerPass = passGenerator.createPass(forEntrant: ManagerType.manager(contactInfo))
    let discounts = "Manager Pass gets a food discount of \(managerPass.foodDiscount)%, and a merchandise discount of \(managerPass.merchandiseDiscount)%"
    print(discounts)
    print("Manager gets access to \(managerPass.accessAreas)")
    print("Does manager get access to all rides? \(managerPass.allRideAccess)")
    print("Does manager get to skip lines for rides? \(managerPass.skipsQueues)")
    print("Manager contact info is: \(managerPass.contactInfo!)")
    */
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

