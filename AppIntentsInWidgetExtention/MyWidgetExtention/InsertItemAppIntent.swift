//
//  IncrementItemAppIntent.swift
//  MyWidgetExtentionExtension
//
//  Created by djzhu on 2024/8/15.
//

import AppIntents
import Foundation
import Shared

struct InsertItemAppIntent: AppIntent {
  static var title: LocalizedStringResource = "InsertItemAppIntent"
  static var description = IntentDescription("Insert a new item")
  static var openAppWhenRun: Bool = false

  @Dependency
  private var storageController: StorageController

  @MainActor
  func perform() async throws -> some ReturnsValue<String> {
    storageController.addItem(name: "Item-\(UUID().uuidString)")
    return .result(value: "success!")
  }
}
