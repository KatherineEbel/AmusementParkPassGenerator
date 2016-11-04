//
//  HourlyEmployeeType.swift
//  AmusementParkPassGenerator
//
//  Created by Katherine Ebel on 11/3/16.
//  Copyright © 2016 Katherine Ebel. All rights reserved.
//

import Foundation


private let employeeFoodDiscount: Percent = 15
private let employeeMerchandiseDicount: Percent = 25

enum HourlyEmployeeType: ParkEntrant, Contactable {
  case foodServices(ContactInformation)
  case rideServices(ContactInformation)
  case maintenance(ContactInformation)
}

extension HourlyEmployeeType {
  var accessAreas: [AccessArea] {
    switch self {
    case .foodServices: return [.amusement, .kitchen]
    case .maintenance: return [.amusement, .kitchen, .rideControl, .maintenance]
    case .rideServices: return [.amusement, .rideControl]
    }
  }
  
  var discounts: (food: Percent, merchandise: Percent) {
    let foodDiscount = DiscountType.food(employeeFoodDiscount).discount
    let merchandiseDiscount = DiscountType.merchandise(employeeMerchandiseDicount).discount
    return (foodDiscount, merchandiseDiscount)
  }
  
  var contactInformation: ContactInformation {
    switch self {
      case .foodServices(let contactInformation): return contactInformation
      case .maintenance(let contactInformation): return contactInformation
      case .rideServices(let contactInformation): return contactInformation
    }
  }
}
