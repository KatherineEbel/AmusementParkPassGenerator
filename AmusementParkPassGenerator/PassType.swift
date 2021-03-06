//
//  PassType.swift
//  AmusementParkPassGenerator
//
//  Created by Katherine Ebel on 11/3/16.
//  Copyright © 2016 Katherine Ebel. All rights reserved.
//

import Foundation

// AccessPassGenerator.AccessPass adopts this protocol ** AccessPass.swift is the extension
protocol PassType {
  var type: ParkEntrant { get }
  var passID: PassID { get }
  var foodDiscount: Percent { get }
  var merchandiseDiscount: Percent { get }
  var allRideAccess: Bool { get }
  var skipsQueues: Bool { get }
  var accessAreas: [AccessArea] { get }
  var contactDetails: String { get }
  func hasAccess(toArea area: AccessArea) -> Bool
}
