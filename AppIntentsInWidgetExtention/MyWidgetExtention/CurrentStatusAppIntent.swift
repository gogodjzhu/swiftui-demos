//
//  CurrentStatus.swift
//  AppIntentsInWidgetExtention
//
//  Created by djzhu on 2024/8/14.
//

import AppIntents
import Foundation
import Shared

struct CurrentStatusAppIntent: AppIntent {
  static var title: LocalizedStringResource = "CurrentStatusAppIntent"
  static var description = IntentDescription("Get the current status of the app.")
  static var openAppWhenRun: Bool = false

  @Dependency
  private var storageController: StorageController

  @MainActor
  func perform() async throws -> some ReturnsValue<Int> {
    return .result(value: storageController.fetchItems().count)
  }
}
