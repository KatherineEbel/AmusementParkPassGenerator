//
//  HourlyEmployeeType.swift
//  AmusementParkPassGenerator
//
//  Created by Katherine Ebel on 11/3/16.
//  Copyright © 2016 Katherine Ebel. All rights reserved.
//

import Foundation

enum HourlyEmployeeType: ParkEntrant {
  case foodServices
  case rideServices
  case maintenance
}

extension HourlyEmployeeType {
  var accessAreas: [AccessArea] {
    switch self {
    case .foodServices: return [.amusement, .kitchen]
    case .maintenance: return [.amusement, .kitchen, .rideControl, .maintenance]
    case .rideServices: return [.amusement, .rideControl]
    }
  }
}
