//
//  HourlyEmployeeType.swift
//  AmusementParkPassGenerator
//
//  Created by Katherine Ebel on 11/3/16.
//  Copyright © 2016 Katherine Ebel. All rights reserved.
//

import Foundation

struct HourlyEmployeeType: ParkEntrant, Contactable {
  let type: type
  var firstName: String
  var lastName: String
  var streetAddress: String
  var city: String
  var state: String
  var zipCode: String
  enum type {
    case foodServices
    case rideServices
    case maintenance
  }
}

extension HourlyEmployeeType {
  var discounts: (food: DiscountType, merchandise: DiscountType)? {
    return (.food(15), .merchandise(25))
  }
  
  var accessAreas: [AccessArea] {
    switch type {
    case .foodServices: return [.amusement, .kitchen]
    case .maintenance: return [.amusement, .kitchen, .rideControl, .maintenance]
    case .rideServices: return [.amusement, .rideControl]
    }
  }
}
