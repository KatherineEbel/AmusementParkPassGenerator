//
//  ManagerType.swift
//  AmusementParkPassGenerator
//
//  Created by Katherine Ebel on 11/3/16.
//  Copyright © 2016 Katherine Ebel. All rights reserved.
//

import Foundation

private let managerFoodDiscount: Percent = 25
private let managerMerchandiseDiscount: Percent = 25

enum ManagerType: ParkEntrant, Contactable {
    case manager(ContactInformation)
}

extension ManagerType {
  var discounts: (food: DiscountType, merchandise: DiscountType)? {
    return (.food(managerFoodDiscount), .merchandise(managerMerchandiseDiscount))
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
