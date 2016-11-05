//
//  ViewController.swift
//  AmusementParkPassGenerator
//
//  Created by Katherine Ebel on 11/3/16.
//  Copyright © 2016 Katherine Ebel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  /**
     Use jump bar to go to marked areas to test each type
     For testing birth dates you can uncomment just the "Test validating Birthdates" section
     For testing Contact info just uncomment the "info for testing contact info section"
     ** The passGenerator (line 22) needs to be uncommented for creating all pass types
  *///

  override func viewDidLoad() {
    super.viewDidLoad()
    // MARK: Pass Generator
    let passGenerator = AccessPassGenerator.passGenerator // pass generator is responsible for creating all access passes and is a singleton
    
    
     // MARK: Stubs for testing GuestTypes
     // MARK: Test Classic Guest
     /*
     let classicGuest = passGenerator.createPass(forEntrant: GuestType.classic)
     let discounts = "Classic guest gets a food discount of \(classicGuest.foodDiscount)%, and a merchandise discount of \(classicGuest.merchandiseDiscount)%"
     let accessAreas = "Classic Guest pass has access to amusement areas? \(classicGuest.hasAccess(toArea: .amusement))"
     let noAccess = "Classic Guest pass has access to kitchen areas? \(classicGuest.hasAccess(toArea: .kitchen))"
     let skipsQueues = "Classic Guest pass can skip lines for rides? \(classicGuest.skipsQueues)"
     let accessToRides = "Classic Guest pass has access to all rides? \(classicGuest.allRideAccess)"
     if let info = classicGuest.contactInfo {
       let _ = "Classic guest contact info: \(info)" // will not get in here contact info is nil
     } else {
       print("Classic guest has no contact information")
     }
     print("\(discounts)\n\(accessAreas)\n\(noAccess)\n\(skipsQueues)\n\(accessToRides)\n")
     */
    
     // MARK: Test VIP Guest
    
     /*
     let vipGuest = passGenerator.createPass(forEntrant: GuestType.VIP)
     let discounts = "VIP guest gets a food discount of \(vipGuest.foodDiscount)%, and a merchandise discount of \(vipGuest.merchandiseDiscount)%"
     let hasAccess = "VIP Guest pass has access to amusement areas? \(vipGuest.hasAccess(toArea: .amusement))"
     let noAccess = "VIP Guest pass has access to office areas? \(vipGuest.hasAccess(toArea: .office))"
     let skipsQueues = "VIP Guest pass can skip lines for rides? \(vipGuest.skipsQueues)"
     let accessToRides = "VIP Guest pass has access to all rides? \(vipGuest.allRideAccess)"
     if let info = vipGuest.contactInfo {
       let _ = "VIP guest contact info: \(info)" // will not get in here contact info is nil
     } else {
       print("VIP guest has no contact information")
     }
     print(vipGuest.contactDetails)
     print("\(discounts)\n\(hasAccess)\n\(noAccess)\n\(skipsQueues)\n\(accessToRides)\n")
     */
    
    // MARK: Test Validating BirthDates
    
    /*
    let badDateFormat = "12-25-2014"
    let tooOld = "2009-10-07"
    let badDatePass = passGenerator.createPass(forEntrant: GuestType.freeChild(birthdate: badDateFormat)) // should throw error for invalid date format  *********(for now defaults to classic pass, will convert to allow for re-entry when UI implemented to handle incorrect format (An error message is still printed)
    print("Pass converted to: \(badDatePass.type)")
    let tooOldPass = passGenerator.createPass(forEntrant: GuestType.freeChild(birthdate: tooOld)) // should throw fails age requirement error (message printed to console) pass will default to classic pass
    print("Pass converted to: \(tooOldPass.type)")
    */
   
    
    // MARK: Test Free Child Pass
    /*
    let goodDateFormat = "2014-12-25"
    let childPass = passGenerator.createPass(forEntrant: GuestType.freeChild(birthdate: goodDateFormat))
    let discounts = "Child guest gets a food discount of \(childPass.foodDiscount)%, and a merchandise discount of \(childPass.merchandiseDiscount)%"
    let hasAccess = "Child Guest pass has access to amusement areas? \(childPass.hasAccess(toArea: .amusement))"
    let noAccess = "Child Guest pass has access to office areas? \(childPass.hasAccess(toArea: .office))"
    let skipsQueues = "Child Guest pass can skip lines for rides? \(childPass.skipsQueues)"
    let accessToRides = "Child Guest pass has access to all rides? \(childPass.allRideAccess)"
    if let info = childPass.contactInfo {
      let _ = "Child guest contact info: \(info)" // will not get in here contact info is nil
    } else {
      print("Child guest has no contact information")
    }
    print("Child guest birthdate has been verified? \(childPass.isVerified)")
    print("\(discounts)\n\(hasAccess)\n\(noAccess)\n\(skipsQueues)\n\(accessToRides)\n")
    */
    
    // MARK: info for testing employee and manager contact information
    /*
    let correctInfo = ["firstName": "John", "lastName": "Doe", "streetAddress": "123 Wonder Road",
                "city": "Somewhere Out there", "state": "FL", "zipCode": "90210"]
    let contactInfo = ContactInformation(withDictionary: correctInfo)! // force unwrapping since I know it contains correct values
    
    let incorrectInfo = ["firstName": "Kathy", "lastName": "Ebel"]
    let failingInfo = ContactInformation(withDictionary: incorrectInfo) // cannot create contact info if dictionary doesn't have correct values
    if let goodInfo = failingInfo {
      let failingPass = passGenerator.createPass(forEntrant: HourlyEmployeeType.rideServices(goodInfo))
      print(failingPass.contactInfo!)
    } else {
        print("Info was bad, so pass not created")
     
    }
    */
    
    // MARK: Stubs for testing all Employee types
    // MARK: Test Ride Services pass
    /*
     let correctInfo = ["firstName": "John", "lastName": "Doe", "streetAddress": "123 Wonder Road",
                "city": "Somewhere Out there", "state": "FL", "zipCode": "90210"]
     let contactInfo = ContactInformation(withDictionary: correctInfo)! // force unwrapping since I know it contains correct values
     let rideServices = passGenerator.createPass(forEntrant: HourlyEmployeeType.rideServices(contactInfo))
     let discounts = "Ride Services employee gets a food discount of \(rideServices.foodDiscount)%, and a merchandise discount of \(rideServices.merchandiseDiscount)%"
     let hasAccess = "ride Services pass has access to ride control areas? \(rideServices.hasAccess(toArea: .rideControl))"
     let noAccess = "ride Services pass has access to office areas? \(rideServices.hasAccess(toArea: .office))"
     let skipsQueues = "Ride Services pass can skip lines for rides? \(rideServices.skipsQueues)"
     let accessToRides = "Ride Services pass has access to all rides? \(rideServices.allRideAccess)"
     let info = "Ride Services pass contact info is: \(rideServices.contactDetails)"
     print("\(discounts)\n\(hasAccess)\n\(noAccess)\n\(skipsQueues)\n\(accessToRides)\n\(info)")
     */
    
    // MARK: Test Food Services pass
    /*
     let correctInfo = ["firstName": "John", "lastName": "Doe", "streetAddress": "123 Wonder Road",
                "city": "Somewhere Out there", "state": "FL", "zipCode": "90210"]
     let contactInfo = ContactInformation(withDictionary: correctInfo)! // force unwrapping since I know it contains correct values
     let foodServicesPass = passGenerator.createPass(forEntrant: HourlyEmployeeType.foodServices(contactInfo))
     let discounts = "Food Services Services employee gets a food discount of \(foodServicesPass.foodDiscount)%, and a merchandise discount of \(foodServicesPass.merchandiseDiscount)%"
     let hasAccess = "Food Services pass has access to kitchen areas? \(foodServicesPass.hasAccess(toArea: .kitchen))"
     let noAccess = "Food Services pass has access to maintenance areas? \(foodServicesPass.hasAccess(toArea: .maintenance))"
     let skipsQueues = "Food Services pass can skip lines for rides? \(foodServicesPass.skipsQueues)"
     let accessToRides = "Food Services pass has access to all rides? \(foodServicesPass.allRideAccess)"
     let info = "Food Services pass contact info is \(foodServicesPass.contactDetails)"
     let allAreas = "Food Services pass gets access to these areas: \(foodServicesPass.accessAreas)"
     print("\(discounts)\n\(hasAccess)\n\(noAccess)\n\(skipsQueues)\n\(accessToRides)\n\(info)\(allAreas)")
     */
    
      // MARK: Test maintenance pass
    /*
    let correctInfo = ["firstName": "John", "lastName": "Doe", "streetAddress": "123 Wonder Road",
                "city": "Somewhere Out there", "state": "FL", "zipCode": "90210"]
    let contactInfo = ContactInformation(withDictionary: correctInfo)! // force unwrapping since I know it contains correct values
    let maintenancePass = passGenerator.createPass(forEntrant: HourlyEmployeeType.maintenance(contactInfo))
    let discounts = "Maintenance employee gets a food discount of \(maintenancePass.foodDiscount)%, and a merchandise discount of \(maintenancePass.merchandiseDiscount)%"
    let hasAccess = "Maintenance pass has access to maintenance areas? \(maintenancePass.hasAccess(toArea: .maintenance))"
    let noAccess = "Maintenance pass has access to office areas? \(maintenancePass.hasAccess(toArea: .office))"
    let skipsQueues = "Maintenance pass can skip lines for rides? \(maintenancePass.skipsQueues)"
    let accessToRides = "Maintenance pass has access to all rides? \(maintenancePass.allRideAccess)"
    let info = "Maintenance pass contact info is \(maintenancePass.contactInfo!)"
    let allAreas = "Maintenance access areas are \(maintenancePass.accessAreas)"
    print("\(discounts)\n\(hasAccess)\n\(noAccess)\n\(skipsQueues)\n\(accessToRides)\n\(info)\n\(allAreas)")
    */
    // MARK: Test Manager Pass
    /*
    let correctInfo = ["firstName": "John", "lastName": "Doe", "streetAddress": "123 Wonder Road",
                "city": "Somewhere Out there", "state": "FL", "zipCode": "90210"]
    let contactInfo = ContactInformation(withDictionary: correctInfo)! // force unwrapping since I know it contains correct values
    let managerPass = passGenerator.createPass(forEntrant: ManagerType.manager(contactInfo))
    let discounts = "Manager gets a food discount of \(managerPass.foodDiscount)%, and a merchandise discount of \(managerPass.merchandiseDiscount)%"
    let hasAccess = "Manager pass has access to maintenance areas? \(managerPass.hasAccess(toArea: .maintenance))"
    let noAccess = "Manager pass has access to office areas? \(managerPass.hasAccess(toArea: .office))"
    let skipsQueues = "Manager pass can skip lines for rides? \(managerPass.skipsQueues)"
    let accessToRides = "Manager pass has access to all rides? \(managerPass.allRideAccess)"
    let info = "Manager pass contact info is \(managerPass.contactDetails)"
    let allAreas = "Manager access areas are \(managerPass.accessAreas)"
    print("\(discounts)\n\(hasAccess)\n\(noAccess)\n\(skipsQueues)\n\(accessToRides)\n\(allAreas)\n\(info)")
    */
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}
