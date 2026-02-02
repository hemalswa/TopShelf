//
//  Book.swift
//  TopShelf
//
//  Created by Hemal Swarnasiri on 2026-02-02.
//

import Foundation

struct Book:  Identifiable, Hashable, Codable  {
  let id : Int
  let name: String
}
