//
//  AccessPass.swift
//  AmusementParkPassGenerator
//
//  Created by Katherine Ebel on 11/3/16.
//  Copyright © 2016 Katherine Ebel. All rights reserved.
//

import Foundation

struct AccessPass: PassType {
  let type: ParkEntrant
}

extension AccessPass: AgeVerifiable {
  // returns foodDiscount for instance of pass
  var foodDiscount: Percent {
    let foodDiscount = type.discounts.food
    return foodDiscount
  }
  
  // returns merchandiseDiscount for instance of pass
  var merchandiseDiscount: Percent {
    return type.discounts.merchandise
  }
  
  // returns true if pass has access to all rides
  var allRideAccess: Bool {
    return type.rideAccess.allRides
  }
  
  // returns true if pass has access to skip line for rides
  var skipsQueues: Bool {
    return type.rideAccess.skipsQueues
  }
  
  var accessAreas: [AccessArea] {
    return type.accessAreas
  }
  
  // returns true if instance of pass has access to given area
  func hasAccess(toArea area: AccessArea) -> Bool {
    return accessAreas.contains(area)
  }
  
  var contactInfo: ContactInformation? {
    switch type {
    case is HourlyEmployeeType:
      let employeeType = type as! HourlyEmployeeType
      return employeeType.contactInformation
    case is ManagerType:
      let managerType = type as! ManagerType
      return managerType.contactInformation
    default:
      return nil
    }
  }
}

extension AccessPass {
  var isVerified: Bool {
    switch type {
      case is GuestType:
        let guestType = type as! GuestType
        switch guestType {
          case .freeChild(birthdate: let date):
            do {
              let verified = try birthDate(dateString: date, meetsRequirement: 5)
              return verified
            } catch let error {
              print("\(error)")
            }
          default: break
        }
      default: break
    }
    return false
  }
}
