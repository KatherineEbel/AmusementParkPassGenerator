//
//  ManagerType.swift
//  AmusementParkPassGenerator
//
//  Created by Katherine Ebel on 11/3/16.
//  Copyright © 2016 Katherine Ebel. All rights reserved.
//

import Foundation

enum ManagerType: ParkEntrant, Contactable {
    case manager(ContactInformation)
}

extension ManagerType {
  var discounts: (food: DiscountType, merchandise: DiscountType)? {
    return (.food(25), .merchandise(25))
  }
  
  var accessAreas: [AccessArea] {
    return [.amusement, .kitchen, .maintenance, .rideControl, .office]
  }
  
  var contactInformation: ContactInformation {
    switch self {
      case .manager(let contactInformation): return contactInformation
    }
  }
}
