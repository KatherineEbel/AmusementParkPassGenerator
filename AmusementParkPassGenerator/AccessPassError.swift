//
//  AccessPassError.swift
//  AmusementParkPassGenerator
//
//  Created by Katherine Ebel on 11/3/16.
//  Copyright © 2016 Katherine Ebel. All rights reserved.
//

import Foundation

// Current main errors for incorrect contact information,
// incorrect date format
// failed to meet age requirement
// and error louding the sounds for card reader
enum AccessPassError: Error {
  case InvalidContactInfoProvided(message: String)
  case InvalidDateFormat(message: String)
  case FailsChildAgeRequirement(message: String)
  case AccessSoundQueueError(message: String)
}
