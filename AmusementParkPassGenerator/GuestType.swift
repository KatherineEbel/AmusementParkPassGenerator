//
//  GuestType.swift
//  AmusementParkPassGenerator
//
//  Created by Katherine Ebel on 11/3/16.
//  Copyright © 2016 Katherine Ebel. All rights reserved.
//

import Foundation

enum GuestType: ParkEntrant, AgeVerifiable {
  case classic
  case VIP
  case freeChild(birthdate: BirthDate)
}

extension GuestType {
  var discounts: (food: Percent, merchandise: Percent) {
    let foodDiscount = DiscountType.food(10).discount
    let merchandiseDiscount = DiscountType.merchandise(15).discount
    switch self {
    case .VIP: return (foodDiscount, merchandiseDiscount)
    default:
      return (0, 0)
    }
  }
  
  var rideAccess: (allRides: Bool, skipsQueues: Bool) {
    switch self {
    case .VIP:
      let allRides = RideAccess.allRides(true).access
      let skipsQueues = RideAccess.skipsQueues(true).access
      return (allRides, skipsQueues)
    default:
      return (false, false)
    }
  }
  
  func isVerifiedDate(date: BirthDate) -> Bool {
    return false
  }
}
