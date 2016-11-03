//
//  GuestType.swift
//  AmusementParkPassGenerator
//
//  Created by Katherine Ebel on 11/3/16.
//  Copyright © 2016 Katherine Ebel. All rights reserved.
//

import Foundation

enum GuestType: ParkEntrant {
  case classic
  case VIP
  case freeChild(AgeVerified)
}

extension GuestType {
  var discounts: (food: DiscountType, merchandise: DiscountType)? {
    switch self {
    case .VIP: return (.food(10), .merchandise(20))
    default:
      return nil
    }
  }
  
  var rideAccess: (allRides: RideAccess, skipsQueues: RideAccess) {
    switch self {
    case .VIP:
      return (.allRides(true), .skipsQueues(true))
    default:
      return (.allRides(true), .skipsQueues(false))
    }
  }
}
