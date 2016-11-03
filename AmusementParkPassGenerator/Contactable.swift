//
//  Contactable.swift
//  AmusementParkPassGenerator
//
//  Created by Katherine Ebel on 11/3/16.
//  Copyright © 2016 Katherine Ebel. All rights reserved.
//

import Foundation

protocol Contactable {
  var firstName: String { get set}
  var lastName: String{ get set}
  var streetAddress: String { get set }
  var city: String { get set }
  var state: String { get set }
  var zipCode: String { get set }
  init(firstName: String, lastName: String, streetAddress: String,
       city: String, state: String, zipCode: String)
  init?(withContactInfo info: [String: String])
}

extension Contactable {
  init?(withContactInfo info: [String: String]) {
    do {
      if let firstName = info["firstName"],
        let lastName = info["lastName"],
        let streetAddress = info["streetAddress"],
        let city = info["city"],
        let state = info["state"],
        let zipCode = info["zipCode"] {
        self.init(firstName: firstName, lastName: lastName, streetAddress: streetAddress,
                  city: city, state: state, zipCode: zipCode)
      } else {
        throw AccessPassError.InvalidContactInfoProvided
      }
      
    } catch AccessPassError.InvalidContactInfoProvided {
        print("Invalid info")
        return nil
    } catch let error {
      fatalError("\(error)")
    }
  }
}
