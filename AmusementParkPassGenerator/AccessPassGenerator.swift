//
//  AccessPassGenerator.swift
//  AmusementParkPassGenerator
//
//  Created by Katherine Ebel on 11/4/16.
//  Copyright © 2016 Katherine Ebel. All rights reserved.
//

import Foundation

final class AccessPassGenerator {
  static let passGenerator = AccessPassGenerator()
  
  func createPass(forEntrant entrant: ParkEntrant) -> AccessPass {
    switch entrant {
    case is GuestType:
      let type = entrant as! GuestType
      return pass(forGuestType: type)
    case is HourlyEmployeeType:
      let type = entrant as! HourlyEmployeeType
      return pass(forEmployeeType: type)
    case is ManagerType:
      let type = entrant as! ManagerType
      return pass(forManagerType: type)
    default: return AccessPass(type: GuestType.classic)
    }
  }
  
  // the only pass that needs to be verified is the free child pass throw error if date not valid
  func pass(forGuestType entrant: GuestType) -> AccessPass {
    let pass: AccessPass
    switch entrant {
      case .classic: pass = AccessPass(type: GuestType.classic)
      case .VIP: pass = AccessPass(type: GuestType.VIP)
      case .freeChild(birthdate: let birthDate):
        do {
          pass = AccessPass(type: GuestType.freeChild(birthdate: birthDate))
          if pass.isVerified {
             return pass
          } else {
            throw AccessPassError.InvalidDateFormat
          }
        } catch AccessPassError.InvalidDateFormat {
            print("Invalid Date")
        } catch let error {
            fatalError("\(error)")
        }
      }
    return pass
  }
  
  func pass(forEmployeeType entrant: HourlyEmployeeType) -> AccessPass {
    switch entrant {
    case .foodServices(let info): return AccessPass(type: HourlyEmployeeType.foodServices(info))
    case .maintenance(let info): return AccessPass(type: HourlyEmployeeType.maintenance(info))
    case .rideServices(let info): return AccessPass(type: HourlyEmployeeType.rideServices(info))
    }
  }
  
  func pass(forManagerType entrant: ManagerType) -> AccessPass {
    switch entrant {
    case .manager(let info):
      return AccessPass(type: ManagerType.manager(info))
    }
  }
  
}
