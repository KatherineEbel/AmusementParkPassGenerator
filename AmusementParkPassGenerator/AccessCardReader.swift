//
//  AccessCardReader.swift
//  AmusementParkPassGenerator
//
//  Created by Katherine Ebel on 11/5/16.
//  Copyright © 2016 Katherine Ebel. All rights reserved.
//

struct AccessCardReader: CardReader {
  static let cardReader = AccessCardReader()
  private init() {}
}
