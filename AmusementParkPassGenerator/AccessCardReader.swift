//
//  AccessCardReader.swift
//  AmusementParkPassGenerator
//
//  Created by Katherine Ebel on 11/5/16.
//  Copyright © 2016 Katherine Ebel. All rights reserved.
//

import AudioToolbox
struct AccessCardReader: CardReader {
  static let cardReader = AccessCardReader()
  private init() {}
}

extension AccessCardReader {
  // returns a message of all accessable areas for pass
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
  
    // returns a message for all types of ride access
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
  
  // returns a message for all associated discounts for pass
  func discountAccess(forPass pass: PassType) -> AccessMessage {
    let foodDiscount = pass.foodDiscount
    let merchandiseDiscount = pass.merchandiseDiscount
    if foodDiscount == 0 && merchandiseDiscount == 0 {
      return "This pass is not eligible for any discounts"
    } else {
      return "This pass gets a food discount of \(foodDiscount)%, and a merchandise discount of \(merchandiseDiscount)%"
    }
  }
  
  // MARK: Swipe Access
  // takes pass and an access area and returns true /plays sound if pass has access
  func accessPass(_ pass: PassType, hasAccessTo area: AccessArea) -> Bool {
    displayBirthdayMessage(forPass: pass)
    let success = pass.hasAccess(toArea: area)
    playSound(success)
    return success
  }
  
  // swipe a pass for individual types of discounts plays appropriate sound
  func accessPass(_ pass: PassType, discountFor type: DiscountType) -> AccessMessage {
    displayBirthdayMessage(forPass: pass)
    var (discountType, discountAmount): (AccessMessage, AccessMessage)
    switch type {
      case .food(let foodDiscount): (discountType, discountAmount) =  ("Food", "\(foodDiscount)")
      case .merchandise(let merchandiseDiscount): (discountType, discountAmount) = ("Merchandise", "\(merchandiseDiscount)")
    }
    playSound(discountAmount != "0")
    return discountAmount == "0" ? "This pass doesn't have a \(discountType) discount" :
      "This pass has a \(discountAmount)% \(discountType) discount"
  }
  
  // swipe a pass for individual types of ride access -- plays appropriate sound
  func accessPass(_ pass: PassType, hasRideAccess type: RideAccess) -> AccessMessage {
    displayBirthdayMessage(forPass: pass)
    var (hasAccess, message): (Bool, AccessMessage)
    switch type {
      case .allRides(let success): (hasAccess, message) = (success, "to all rides")
      case .skipsQueues(let success): (hasAccess, message) = (success, "to skip lines for rides")
    }
    playSound(hasAccess)
    return hasAccess ? "This pass has access \(message)" : "This pass doesn't have access \(message)"
  }
  
  // pass will be checked every time it is swiped *** only child passes currently have associated birthdays
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
  
  // will only print a message if there is one to display
  private func displayBirthdayMessage(forPass pass: PassType) {
    let birthDayMessage = alertBirthday(forPass: pass)
    if !birthDayMessage.isEmpty {
      print(birthDayMessage)
    }
  }
  
  // MARK: Helper methods
  // this formats the entrants birthday and current days date in the same way, and
  // strips the year off of both and compares the remaining strings. If they are 
  // equal, it is the entrant's birthday.
  // I currently only have birthdays attached to child passes.
  private func isBirthday(forPass pass: PassType, withDate date: BirthDate) -> Bool {
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
  
  // called for swipe features displays error message if sound can't be loaded
  func playSound(_ success: Bool) {
    let soundCue: AccessSoundCue = success ? .accessGranted : .accessDenied
    do {
      let soundID = try AccessSoundCue.sound(fromRawValue: soundCue.rawValue)
      AudioServicesPlaySystemSound(soundID)
    } catch AccessPassError.AccessSoundQueueError(message: let message) {
      print(message)
    } catch let error {
      print("\(error)")
    }
  }
}
