//
//  ParkEntitlements.swift
//  AmusementParkPassGenerator
//
//  Created by Katherine Ebel on 11/3/16.
//  Copyright © 2016 Katherine Ebel. All rights reserved.
//

import Foundation

typealias Percent = Int

enum DiscountType {
  case food(Percent)
  case merchandise(Percent)
}

enum RideAccess {
  case allRides(Bool)
  case skipsQueues(Bool)
}

enum AccessArea {
  case amusement
  case kitchen
  case rideControl
  case maintenance
  case office
}
