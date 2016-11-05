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
  var rideAccess: (allRides: Bool, skipsQueues: Bool) { get }
  var discounts: (food: Percent, merchandise: Percent) { get }
}

extension ParkEntrant {
  var accessAreas: [AccessArea] {
    return [.amusement]
  }
  
  var rideAccess: (allRides: Bool, skipsQueues: Bool) {
    let allRides = RideAccess.allRides(true).access
    let skipsQueues = RideAccess.skipsQueues(false).access
    return (allRides, skipsQueues)
  }
  
  var discounts: (food: Percent, merchandise: Percent) {
    return (0, 0)
  }
}

extension ParkEntrant where Self: Contactable {
  // returns nice formatted details for a Contactable park entrant
  var contactDetails: String {
    let (firstName, lastName) = (contactInformation.firstName, contactInformation.lastName)
    let (streetAddress, city) = (contactInformation.streetAddress, contactInformation.city)
    let (state, zipCode) = (contactInformation.state, contactInformation.zipCode)
    return "\(firstName) \(lastName) lives at \(streetAddress) \(city) \(state), \(zipCode)"
  }
}
