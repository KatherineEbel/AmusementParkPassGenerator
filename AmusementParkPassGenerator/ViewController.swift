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
     ** The passGenerator (line 21) needs to be uncommented for creating all pass types
     ** The cardReader variable (line 24) needs to be uncommented also to read pass info
     ** (comment out individual swipe tests to hear sounds for one test)
   I created a button action, just uncomment the code you want to test and click the button
   to run the code
  *///
  @IBAction func testAccess() {
    // MARK: Pass Generator
    let passGenerator = AccessPassGenerator.passGenerator // pass generator is responsible for creating all access passes and is a singleton
    
    // MARK: Card Reader
    let cardReader = AccessCardReader.cardReader
    
     // MARK: Stubs for testing GuestTypes
    
     // MARK: Test Classic Guest  (comment out individual swipe tests to hear sounds for one test)
    
//     let classicGuest = passGenerator.createPass(forEntrant: GuestType.classic)
//     print(cardReader.discountAccess(forPass: classicGuest)) // prints list of available discounts
//     print(cardReader.areaAccess(forPass: classicGuest)) // prints all areas accessible to pass
//     print(classicGuest.contactDetails) // how to access contact details (classic guest won't have any)
     // test swipe feature
//     print(cardReader.accessPass(classicGuest, discountFor: .food(classicGuest.foodDiscount)))
//     print(cardReader.accessPass(classicGuest, discountFor: .merchandise(classicGuest.merchandiseDiscount)))
//     print(cardReader.accessPass(classicGuest, hasAccessTo: .amusement))  // does have access
//     print(cardReader.accessPass(classicGuest, hasAccessTo: .maintenance)) // doesn't have access
//     print(cardReader.accessPass(classicGuest, hasRideAccess: .allRides(classicGuest.allRideAccess)))
//     print(cardReader.accessPass(classicGuest, hasRideAccess: .skipsQueues(classicGuest.skipsQueues)))
    
         // MARK: Test VIP Guest
    
//     let vipGuest = passGenerator.createPass(forEntrant: GuestType.VIP)
//     print(cardReader.discountAccess(forPass: vipGuest)) // prints list of available discounts
//     print(cardReader.areaAccess(forPass: vipGuest)) // prints all areas accessible to pass
//     print(vipGuest.contactDetails) // how to access contact details (classic guest won't have any)
//     // test swipe feature
//     print(cardReader.accessPass(vipGuest, discountFor: .food(vipGuest.foodDiscount)))
//     print(cardReader.accessPass(vipGuest, discountFor: .merchandise(vipGuest.merchandiseDiscount)))
//     print(cardReader.accessPass(vipGuest, hasAccessTo: .amusement))  // does have access
//     print(cardReader.accessPass(vipGuest, hasAccessTo: .maintenance)) // doesn't have access
//     print(cardReader.accessPass(vipGuest, hasRideAccess: .allRides(vipGuest.allRideAccess)))
//     print(cardReader.accessPass(vipGuest, hasRideAccess: .skipsQueues(vipGuest.skipsQueues)))
    
      // MARK: Test Validating BirthDates
    
//    let badDateFormat = "12-25-2014"
//    let tooOld = "2009-10-07"
//    let badDatePass = passGenerator.createPass(forEntrant: GuestType.freeChild(birthdate: badDateFormat)) // should throw error for invalid date format  *********(for now defaults to classic pass, will convert to allow for re-entering info when UI implemented to handle incorrect format (An error message is still printed)
//    let tooOldPass = passGenerator.createPass(forEntrant: GuestType.freeChild(birthdate: tooOld)) // should throw fails age requirement error (message printed to console) pass will default to classic pass
//    print("Pass converted to: \(tooOldPass.type)")
    
    // MARK: Test Free Child Pass
//     let birthDate = "2014-11-06"
//     let childGuest = passGenerator.createPass(forEntrant: GuestType.freeChild(birthdate: birthDate))
//     print(cardReader.discountAccess(forPass: childGuest)) // prints list of available discounts
//     print(cardReader.areaAccess(forPass: childGuest)) // prints all areas accessible to pass
//     print(childGuest.contactDetails) // how to access contact details (classic guest won't have any)
//      test swipe feature
//     print(cardReader.accessPass(childGuest, discountFor: .food(childGuest.foodDiscount)))
//     print(cardReader.accessPass(childGuest, discountFor: .merchandise(childGuest.merchandiseDiscount)))
//     print(cardReader.accessPass(childGuest, hasAccessTo: .amusement))  // does have access
//     print(cardReader.accessPass(childGuest, hasAccessTo: .maintenance)) // doesn't have access
//     print(cardReader.accessPass(childGuest, hasRideAccess: .allRides(childGuest.allRideAccess)))
//     print(cardReader.accessPass(childGuest, hasRideAccess: .skipsQueues(childGuest.skipsQueues)))
    
     // MARK: Info for testing employee and manager contact information
    
//    let correctInfo = ["firstName": "John", "lastName": "Doe", "streetAddress": "123 Wonder Road",
//                "city": "Somewhere Out there", "state": "FL", "zipCode": "90210"]
//    let contactInfo = ContactInformation(withDictionary: correctInfo)! // force unwrapping since I know it contains correct values
//    
//    let incorrectInfo = ["firstName": "Kathy", "lastName": "Ebel"]
//    let failingInfo = ContactInformation(withDictionary: incorrectInfo) // cannot create contact info if dictionary doesn't have correct values
//    if let goodInfo = failingInfo {
//      let failingPass = passGenerator.createPass(forEntrant: HourlyEmployeeType.rideServices(goodInfo))
//      print(failingPass.contactDetails)
//    } else {
//        print("Info was bad, so pass not created")
//     
//    }
    
    // MARK: Stubs for testing all Employee types
    
    // MARK: Test Ride Services pass
    
//     let correctInfo = ["firstName": "John", "lastName": "Doe", "streetAddress": "123 Wonder Road",
//                "city": "Somewhere Out there", "state": "FL", "zipCode": "90210"]
//     let contactInfo = ContactInformation(withDictionary: correctInfo)! // force unwrapping since I know it contains correct values
//     let rideServices = passGenerator.createPass(forEntrant: HourlyEmployeeType.rideServices(contactInfo))
//     print(cardReader.discountAccess(forPass: rideServices)) // prints list of available discounts
//     print(cardReader.areaAccess(forPass: rideServices)) // prints all areas accessible to pass
//     print(rideServices.contactDetails) // how to access contact details
//     // test swipe feature
//     print(cardReader.accessPass(rideServices, discountFor: .food(rideServices.foodDiscount)))
//     print(cardReader.accessPass(rideServices, discountFor: .merchandise(rideServices.merchandiseDiscount)))
//     print(cardReader.accessPass(rideServices, hasAccessTo: .rideControl))  // does have access
//     print(cardReader.accessPass(rideServices, hasAccessTo: .maintenance)) // doesn't have access
//     print(cardReader.accessPass(rideServices, hasRideAccess: .allRides(rideServices.allRideAccess)))
//     print(cardReader.accessPass(rideServices, hasRideAccess: .skipsQueues(rideServices.skipsQueues)))
    
     // MARK: Test Food Services pass
    
//     let correctInfo = ["firstName": "John", "lastName": "Doe", "streetAddress": "123 Wonder Road",
//                "city": "Somewhere Out there", "state": "FL", "zipCode": "90210"]
//     let contactInfo = ContactInformation(withDictionary: correctInfo)! // force unwrapping since I know it contains correct values
//     let foodService = passGenerator.createPass(forEntrant: HourlyEmployeeType.foodServices(contactInfo))
//     print(cardReader.discountAccess(forPass: foodService)) // prints list of available discounts
//     print(cardReader.areaAccess(forPass: foodService)) // prints all areas accessible to pass
//     print(foodService.contactDetails) // how to access contact details
//     // test swipe feature
//     print(cardReader.accessPass(foodService, discountFor: .food(foodService.foodDiscount)))
//     print(cardReader.accessPass(foodService, discountFor: .merchandise(foodService.merchandiseDiscount)))
//     print(cardReader.accessPass(foodService, hasAccessTo: .kitchen))  // does have access
//     print(cardReader.accessPass(foodService, hasAccessTo: .maintenance)) // doesn't have access
//     print(cardReader.accessPass(foodService, hasRideAccess: .allRides(foodService.allRideAccess)))
//     print(cardReader.accessPass(foodService, hasRideAccess: .skipsQueues(foodService.skipsQueues)))
    
    // MARK: Test Maintenance Pass
    
//     let correctInfo = ["firstName": "John", "lastName": "Doe", "streetAddress": "123 Wonder Road",
//                "city": "Somewhere Out there", "state": "FL", "zipCode": "90210"]
//     let contactInfo = ContactInformation(withDictionary: correctInfo)! // force unwrapping since I know it contains correct values
//     let maintenance = passGenerator.createPass(forEntrant: HourlyEmployeeType.maintenance(contactInfo))
//     print(cardReader.discountAccess(forPass: maintenance)) // prints list of available discounts
//     print(cardReader.areaAccess(forPass: maintenance)) // prints all areas accessible to pass
//     print(maintenance.contactDetails) // how to access contact details
//     // test swipe feature
//     print(cardReader.accessPass(maintenance, discountFor: .food(maintenance.foodDiscount)))
//     print(cardReader.accessPass(maintenance, discountFor: .merchandise(maintenance.merchandiseDiscount)))
//     print(cardReader.accessPass(maintenance, hasAccessTo: .kitchen))  // does have access
//     print(cardReader.accessPass(maintenance, hasAccessTo: .office)) // doesn't have access
//     print(cardReader.accessPass(maintenance, hasRideAccess: .allRides(maintenance.allRideAccess)))
//     print(cardReader.accessPass(maintenance, hasRideAccess: .skipsQueues(maintenance.skipsQueues)))
    
      // MARK: Test Manager Pass
//     let correctInfo = ["firstName": "John", "lastName": "Doe", "streetAddress": "123 Wonder Road",
//                "city": "Somewhere Out there", "state": "FL", "zipCode": "90210"]
//     let contactInfo = ContactInformation(withDictionary: correctInfo)! // force unwrapping since I know it contains correct values
//     let manager = passGenerator.createPass(forEntrant: ManagerType.manager(contactInfo))
//     print(cardReader.discountAccess(forPass: manager)) // prints list of available discounts
//     print(cardReader.areaAccess(forPass: manager)) // prints all areas accessible to pass
//     print(manager.contactDetails) // how to access contact details
//     // test swipe feature
//     print(cardReader.accessPass(manager, discountFor: .food(manager.foodDiscount)))
//     print(cardReader.accessPass(manager, discountFor: .merchandise(manager.merchandiseDiscount)))
//     print(cardReader.accessPass(manager, hasAccessTo: .kitchen))  // does have access
//     print(cardReader.accessPass(manager, hasAccessTo: .office)) // does have access
//     print(cardReader.accessPass(manager, hasRideAccess: .allRides(manager.allRideAccess)))
//     print(cardReader.accessPass(manager, hasRideAccess: .skipsQueues(manager.skipsQueues)))
  }

  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}
