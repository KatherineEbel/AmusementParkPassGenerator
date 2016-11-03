//
//  AccessPassGenerator.swift
//  AmusementParkPassGenerator
//
//  Created by Katherine Ebel on 11/3/16.
//  Copyright © 2016 Katherine Ebel. All rights reserved.
//

import Foundation

class AccessPassGenerator: AgeVerified {
  static let accessPassGenerator = AccessPassGenerator()
  static var dateFormatter: DateFormatter = {
    var dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    return dateFormatter
  }()
  
  static func pass(forEntrant entrant: ParkEntrant, withInfo info: ContactInformation?) -> PassType {
    guard let info = info else {
      print("No info provided, are you sure")
    }
    switch entrant {
    case is GuestType:
      return pass(forGuestType: entrant)
    case is HourlyEmployeeType:
    case is ManagerType:
    default:
      <#code#>
    }
  }
  
  static func pass(forGuestType entrant: GuestType) -> AccessPass {
    switch entrant {
    case .classic:
      return AccessPass(type: GuestType.classic, contactInformation: nil)
    case .VIP:
      return AccessPass(type: GuestType.VIP, contactInformation: nil)
    default:
      let birthdate = "2012-10-09"
      return AccessPass(type: GuestType.freeChild(birthdate: birthdate), contactInformation: nil)
    }
  }
  
  static func pass(forHourlyEmployeeType entrant: HourlyEmployeeType, withInfo info: ContactInformation) -> AccessPass {
    return AccessPass(type: entrant, contactInformation: info)
  }
  
  static func pass(forHourlyEmployeeType entrant: ManagerType, withInfo info: ContactInformation) -> AccessPass {
    return AccessPass(type: entrant, contactInformation: info)
  }
  
  static func birthdate(dateString: BirthDate, meetsRequirement age: Double) throws -> Bool {
    let today = Date()
    guard let birthdate = dateFormatter.date(from: dateString) else {
      throw AccessPassError.InvalidDateFormat
    }
    let timeInterval = today.timeIntervalSince(birthdate)
    return years(fromSeconds: timeInterval) < age
  }
}

extension AccessPassGenerator {
}
