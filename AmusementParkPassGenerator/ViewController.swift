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
     ** The passGenerator (line 24) needs to be uncommented for creating all pass types
     ** The cardReader variable (line 27) needs to be uncommented also to read pass info
     ** (comment out individual swipe tests to hear sounds for one test)
   I created a button action, just uncomment the code you want to test and click the button
   to run the code.
  *///
  @IBAction func testAccess() {
    // MARK: Pass Generator
    let passGenerator = AccessPassGenerator.sharedPassGenerator // pass generator is responsible for creating all access passes and is a singleton
    
    // MARK: Card Reader
    var cardReader = AccessCardReader.sharedCardReader
    
    // MARK: Extra credit prevent double swipes
    // each pass has a pass id the requirement said to check swipes for rides so  restriction is currently only
    // on the ride access "swipe", but could be modified to use on other kinds of swipes also.
    // when the pass is swiped, the id is recorded as the card reader's "lastCardId", along with a timeStamp, so card will not be
    // permitted if it is swiped a second time in a row within the allowed amount of time (currently 10 seconds). 
    
//    let guestPass = passGenerator.createPass(forEntrant: GuestType.classic)
//    // this first swipe will be accepted
//    print(cardReader.swipeAccess(guestPass, hasRideAccess: .allRides(guestPass.allRideAccess)))
//    
//    // ******* change timeInterval for timer to anything above 10 and the swipe inside the closure should succeed. Will fail for
//    // anything less than 10 seconds.
//    
//    let _ = Timer.scheduledTimer(withTimeInterval: cardReader.minimumTimeWait, repeats: false) { _ in // timer just to test the timeStamp feature... card reader tracks timeStamps
//      print(cardReader.swipeAccess(guestPass, hasRideAccess: .allRides(guestPass.allRideAccess)))
//    }
    
    // you can add next two lines inside closure, and this pass should be allowed regardless of the time in between
    // swipes since passID is different
    // MARK: Check different passID will be accepted before minimumTimeWait
//    let vipGuest = passGenerator.createPass(forEntrant: GuestType.VIP)
//    print(cardReader.swipeAccess(vipGuest, hasRideAccess: .allRides(vipGuest.allRideAccess)))
    
    
     // MARK: Stubs for testing GuestTypes
    
     // MARK: Test Classic Guest  (comment out individual swipe tests to hear sounds for one test)
    
//     let classicGuest = passGenerator.createPass(forEntrant: GuestType.classic)
//     print(cardReader.discountAccess(forPass: classicGuest)) // prints list of available discounts
//     print(cardReader.areaAccess(forPass: classicGuest)) // prints all areas accessible to pass
//     print(classicGuest.contactDetails) // how to access contact details (classic guest won't have any)
     // test swipe feature
//     print(cardReader.swipeAccess(classicGuest, discountFor: .food(classicGuest.foodDiscount)))
//     print(cardReader.swipeAccess(classicGuest, discountFor: .merchandise(classicGuest.merchandiseDiscount)))
//     print(cardReader.swipeAccess(classicGuest, hasAccessTo: .amusement))  // does have access
//     print(cardReader.swipeAccess(classicGuest, hasAccessTo: .maintenance)) // doesn't have access
//     print(cardReader.swipeAccess(classicGuest, hasRideAccess: .allRides(classicGuest.allRideAccess)))
//     print(cardReader.swipeAccess(classicGuest, hasRideAccess: .skipsQueues(classicGuest.skipsQueues)))
    
         // MARK: Test VIP Guest
    
//     let vipGuest = passGenerator.createPass(forEntrant: GuestType.VIP)
//     print(cardReader.discountAccess(forPass: vipGuest)) // prints list of available discounts
//     print(cardReader.areaAccess(forPass: vipGuest)) // prints all areas accessible to pass
//     print(vipGuest.contactDetails) // how to access contact details (classic guest won't have any)
//     // test swipe feature
//     print(cardReader.swipeAccess(vipGuest, discountFor: .food(vipGuest.foodDiscount)))
//     print(cardReader.swipeAccess(vipGuest, discountFor: .merchandise(vipGuest.merchandiseDiscount)))
//     print(cardReader.swipeAccess(vipGuest, hasAccessTo: .amusement))  // does have access
//     print(cardReader.swipeAccess(vipGuest, hasAccessTo: .maintenance)) // doesn't have access
//     print(cardReader.swipeAccess(vipGuest, hasRideAccess: .allRides(vipGuest.allRideAccess)))
//     print(cardReader.swipeAccess(vipGuest, hasRideAccess: .skipsQueues(vipGuest.skipsQueues)))
    
      // MARK: Test Validating BirthDates
    
//    let badDateFormat = "12-25-2014"
//    let tooOld = "2009-10-07"
//    let badDatePass = passGenerator.createPass(forEntrant: GuestType.freeChild(birthdate: badDateFormat)) // should throw error for invalid date format  *********(for now defaults to classic pass, will convert to allow for re-entering info when UI implemented to handle incorrect format (An error message is still printed)
//    let tooOldPass = passGenerator.createPass(forEntrant: GuestType.freeChild(birthdate: tooOld)) // should throw fails age requirement error (message printed to console) pass will default to classic pass
//    print("Pass converted to: \(tooOldPass.type)")
    
    // MARK: Test Free Child Pass -- will trigger Happy Birthday
//     let birthDate = "2014-11-07" // Make sure date is current month, day to test Birthday message
//     let childGuest = passGenerator.createPass(forEntrant: GuestType.freeChild(birthdate: birthDate))
//     print(cardReader.discountAccess(forPass: childGuest)) // prints list of available discounts
//     print(cardReader.areaAccess(forPass: childGuest)) // prints all areas accessible to pass
//     print(childGuest.contactDetails) // how to access contact details (classic guest won't have any)
//      // test swipe feature
//     print(cardReader.swipeAccess(childGuest, discountFor: .food(childGuest.foodDiscount)))
//     print(cardReader.swipeAccess(childGuest, discountFor: .merchandise(childGuest.merchandiseDiscount)))
//     print(cardReader.swipeAccess(childGuest, hasAccessTo: .amusement))  // does have access
//     print(cardReader.swipeAccess(childGuest, hasAccessTo: .maintenance)) // doesn't have access
//     print(cardReader.swipeAccess(childGuest, hasRideAccess: .allRides(childGuest.allRideAccess)))
//     print(cardReader.swipeAccess(childGuest, hasRideAccess: .skipsQueues(childGuest.skipsQueues)))
    
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
//     print(cardReader.swipeAccess(rideServices, discountFor: .food(rideServices.foodDiscount)))
//     print(cardReader.swipeAccess(rideServices, discountFor: .merchandise(rideServices.merchandiseDiscount)))
//     print(cardReader.swipeAccess(rideServices, hasAccessTo: .rideControl))  // does have access
//     print(cardReader.swipeAccess(rideServices, hasAccessTo: .maintenance)) // doesn't have access
//     print(cardReader.swipeAccess(rideServices, hasRideAccess: .allRides(rideServices.allRideAccess)))
//     print(cardReader.swipeAccess(rideServices, hasRideAccess: .skipsQueues(rideServices.skipsQueues)))
    
     // MARK: Test Food Services pass
//    
//     let correctInfo = ["firstName": "John", "lastName": "Doe", "streetAddress": "123 Wonder Road",
//                "city": "Somewhere Out there", "state": "FL", "zipCode": "90210"]
//     let contactInfo = ContactInformation(withDictionary: correctInfo)! // force unwrapping since I know it contains correct values
//     let foodService = passGenerator.createPass(forEntrant: HourlyEmployeeType.foodServices(contactInfo))
//     print(cardReader.discountAccess(forPass: foodService)) // prints list of available discounts
//     print(cardReader.areaAccess(forPass: foodService)) // prints all areas accessible to pass
//     print(foodService.contactDetails) // how to access contact details
//     // test swipe feature
//     print(cardReader.swipeAccess(foodService, discountFor: .food(foodService.foodDiscount)))
//     print(cardReader.swipeAccess(foodService, discountFor: .merchandise(foodService.merchandiseDiscount)))
//     print(cardReader.swipeAccess(foodService, hasAccessTo: .kitchen))  // does have access
//     print(cardReader.swipeAccess(foodService, hasAccessTo: .maintenance)) // doesn't have access
//     print(cardReader.swipeAccess(foodService, hasRideAccess: .allRides(foodService.allRideAccess)))
//     print(cardReader.swipeAccess(foodService, hasRideAccess: .skipsQueues(foodService.skipsQueues)))
    
    // MARK: Test Maintenance Pass
//    
//     let correctInfo = ["firstName": "John", "lastName": "Doe", "streetAddress": "123 Wonder Road",
//                "city": "Somewhere Out there", "state": "FL", "zipCode": "90210"]
//     let contactInfo = ContactInformation(withDictionary: correctInfo)! // force unwrapping since I know it contains correct values
//     let maintenance = passGenerator.createPass(forEntrant: HourlyEmployeeType.maintenance(contactInfo))
//     print(cardReader.discountAccess(forPass: maintenance)) // prints list of available discounts
//     print(cardReader.areaAccess(forPass: maintenance)) // prints all areas accessible to pass
//     print(maintenance.contactDetails) // how to access contact details
//     // test swipe feature
//     print(cardReader.swipeAccess(maintenance, discountFor: .food(maintenance.foodDiscount)))
//     print(cardReader.swipeAccess(maintenance, discountFor: .merchandise(maintenance.merchandiseDiscount)))
//     print(cardReader.swipeAccess(maintenance, hasAccessTo: .kitchen))  // does have access
//     print(cardReader.swipeAccess(maintenance, hasAccessTo: .office)) // doesn't have access
//     print(cardReader.swipeAccess(maintenance, hasRideAccess: .allRides(maintenance.allRideAccess)))
//     print(cardReader.swipeAccess(maintenance, hasRideAccess: .skipsQueues(maintenance.skipsQueues)))
    
      // MARK: Test Manager Pass
//     let correctInfo = ["firstName": "John", "lastName": "Doe", "streetAddress": "123 Wonder Road",
//                "city": "Somewhere Out there", "state": "FL", "zipCode": "90210"]
//     let contactInfo = ContactInformation(withDictionary: correctInfo)! // force unwrapping since I know it contains correct values
//     let manager = passGenerator.createPass(forEntrant: ManagerType.manager(contactInfo))
//     print(cardReader.discountAccess(forPass: manager)) // prints list of available discounts
//     print(cardReader.areaAccess(forPass: manager)) // prints all areas accessible to pass
//     print(manager.contactDetails) // how to access contact details
//     // test swipe feature
//     print(cardReader.swipeAccess(manager, discountFor: .food(manager.foodDiscount)))
//     print(cardReader.swipeAccess(manager, discountFor: .merchandise(manager.merchandiseDiscount)))
//     print(cardReader.swipeAccess(manager, hasAccessTo: .kitchen))  // does have access
//     print(cardReader.swipeAccess(manager, hasAccessTo: .office)) // does have access
//     print(cardReader.swipeAccess(manager, hasRideAccess: .allRides(manager.allRideAccess)))
//     print(cardReader.swipeAccess(manager, hasRideAccess: .skipsQueues(manager.skipsQueues)))
  }

  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}
