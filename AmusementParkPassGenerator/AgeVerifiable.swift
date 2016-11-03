//
//  AgeVerifiable.swift
//  AmusementParkPassGenerator
//
//  Created by Katherine Ebel on 11/3/16.
//  Copyright © 2016 Katherine Ebel. All rights reserved.
//

import Foundation

typealias BirthDate = String

protocol AgeVerified {
  static func years(fromSeconds seconds: TimeInterval) -> TimeInterval
  static func birthdate(dateString: String, meetsRequirement age: Double) throws -> Bool
}

extension AgeVerified {
  static func years(fromSeconds seconds: TimeInterval) -> TimeInterval {
    // 60 sec per min 60 min per hour 24 hour per day avg 365.2425 day per year
    let numSecInYear = 60 * 60 * 24 * 365.2425
    return seconds / numSecInYear
  }
}
