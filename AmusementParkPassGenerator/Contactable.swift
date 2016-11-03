//
//  Contactable.swift
//  AmusementParkPassGenerator
//
//  Created by Katherine Ebel on 11/3/16.
//  Copyright © 2016 Katherine Ebel. All rights reserved.
//

import Foundation

protocol Contactable {
  var firstName: String { get }
  var lastName: String{ get }
  var streetAddress: String { get }
  var city: String { get }
  var state: String { get }
  var zipCode: String { get }
  init?(withDictionary info: [String: String])
}

