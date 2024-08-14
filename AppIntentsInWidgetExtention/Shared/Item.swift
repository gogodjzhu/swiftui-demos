//
//  Item.swift
//  Shared
//
//  Created by djzhu on 2024/8/14.
//

import Foundation
import SwiftData

@Model
public class Item: Identifiable {
  @Attribute(.unique)
  public var id: UUID

  public var name: String
  
  public init(id: UUID, name: String) {
    self.id = id
    self.name = name
  }
}
