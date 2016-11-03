//
//  ParkEntrant.swift
//  AmusementParkPassGenerator
//
//  Created by Katherine Ebel on 11/3/16.
//  Copyright © 2016 Katherine Ebel. All rights reserved.
//

import Foundation

protocol ParkEntrant {
  var accessAreas: [AccessArea] { get }
  var rideAccess: (allRides: RideAccess, skipsQueues: RideAccess) { get }
  var discounts: (food: DiscountType, merchandise: DiscountType)? { get }
}

extension ParkEntrant {
  var accessAreas: [AccessArea] {
    return [.amusement]
  }
  
  var rideAccess: (allRides: RideAccess, skipsQueues: RideAccess) {
    return (.allRides(true), .skipsQueues(false))
  }
  
  var discounts: (food: DiscountType, merchandise: DiscountType)? {
    return nil
  }
}
