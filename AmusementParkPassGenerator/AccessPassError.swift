//
//  AccessPassError.swift
//  AmusementParkPassGenerator
//
//  Created by Katherine Ebel on 11/3/16.
//  Copyright © 2016 Katherine Ebel. All rights reserved.
//

import Foundation

enum AccessPassError: Error {
  case InvalidContactInfoProvided(message: String)
  case InvalidDateFormat(message: String)
  case FailsChildAgeRequirement(message: String)
}
