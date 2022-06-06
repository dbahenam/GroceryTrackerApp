//
//  GroceryData.swift
//  GroceryTracker
//
//  Created by
//

import Foundation

struct GroceryData : Decodable{
  var item_name : String
  var item_count : Int
  static let example = GroceryData(item_name: "", item_count: 0)
}

struct Main : Decodable{
  let temp : Double
}
