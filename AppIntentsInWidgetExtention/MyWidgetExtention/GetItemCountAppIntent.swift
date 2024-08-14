//
//  CurrentStatus.swift
//  AppIntentsInWidgetExtention
//
//  Created by djzhu on 2024/8/14.
//

import AppIntents
import Foundation
import Shared

struct GetItemCountAppIntent: AppIntent {
  static var title: LocalizedStringResource = "GetItemCountAppIntent"
  static var description = IntentDescription("Get the item count")
  static var openAppWhenRun: Bool = false

  @Dependency
  private var storageController: StorageController

  @MainActor
  func perform() async throws -> some ReturnsValue<Int> {
    return .result(value: storageController.fetchItems().count)
  }
}
