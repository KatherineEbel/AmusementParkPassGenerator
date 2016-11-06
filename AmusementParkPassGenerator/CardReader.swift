//
//  CardReader.swift
//  AmusementParkPassGenerator
//
//  Created by Katherine Ebel on 11/5/16.
//  Copyright © 2016 Katherine Ebel. All rights reserved.
//
import Foundation

typealias AccessMessage = String
protocol CardReader {
  func areaAccess(forPass pass: PassType) -> AccessMessage
  func rideAccess(forPass pass: PassType) -> AccessMessage
  func discountAccess(forPass pass: PassType) -> AccessMessage
  func alertBirthday(forPass pass: PassType) -> AccessMessage
}

extension CardReader {
  func areaAccess(forPass pass: PassType) -> AccessMessage {
    let message: AccessMessage = "Card has access for: "
    let accessAreas = pass.accessAreas.map { (accessArea) -> String in
      accessArea.rawValue
    }
    if accessAreas.count > 1 {
      let prefix = accessAreas.prefix(accessAreas.count - 1)
      let suffix = accessAreas.suffix(1).first!
      return "\(message) \(prefix.joined(separator: " area, ")) and \(suffix) area"
    } else {
      return "\(message) \(accessAreas[0]) area"
    }
  }
  
  func rideAccess(forPass pass: PassType) -> AccessMessage {
    var message = "Pass has access to: "
    let allRideAccess = pass.allRideAccess
    let skipsQueues = pass.skipsQueues
    message += allRideAccess ? "All Rides" : ""
    if allRideAccess && skipsQueues {
      message += " ,and skips lines for queues"
    }
    return message
  }
  
  func discountAccess(forPass pass: PassType) -> AccessMessage {
    let foodDiscount = pass.foodDiscount
    let merchandiseDiscount = pass.merchandiseDiscount
    if foodDiscount == 0 && merchandiseDiscount == 0 {
      return "This pass is not eligible for any discounts"
    } else {
      return "This pass gets a food discount of \(foodDiscount)%, and a merchandise discount of \(merchandiseDiscount)%"
    }
  }
  
  func alertBirthday(forPass pass: PassType) -> AccessMessage {
    guard pass.type is AgeVerifiable && pass.type is GuestType else {
      return ""
    }
    switch pass.type as! GuestType {
    case .classic, .VIP: return ""
    case .freeChild(birthdate: let birthday):
      let isMatch = isBirthday(forPass: pass, withDate: birthday)
      return isMatch ? "Happy Birthday!" : ""
    }
    
  }
  // MARK: Helper methods
  // this formats the entrants birthday and current days date in the same way, and
  // strips the year off of both and compares the remaining strings. If they are 
  // equal, it is the entrant's birthday.
  // I currently only have birthdays attached to child passes.
  func isBirthday(forPass pass: PassType, withDate date: BirthDate) -> Bool {
    let accessPass = pass as! AccessPassGenerator.AccessPass
    let formatter = accessPass.dateFormatter
    let todaysDate = formatter.string(from: Date())
    let index: String.Index = date.index(date.startIndex, offsetBy: 5)
    if date.substring(from: index) == todaysDate.substring(from: index) {
      return true
    } else {
      return false
    }
  }
}
