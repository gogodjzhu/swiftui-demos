//
//  StorageController.swift
//  Shared
//
//  Created by djzhu on 2024/8/14.
//

import Foundation
import OSLog
import SwiftData
import SwiftUI

public class StorageController: @unchecked Sendable {
  @MainActor
  public static var globalInstance: StorageController = StorageController()

  let modelContainer: ModelContainer
  let modelContext: ModelContext
  @MainActor
  init() {
    do {
      let schema = Schema([
        Item.self,
      ])
      let config = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
      modelContainer = try ModelContainer(for: schema, configurations: config)
      modelContext = modelContainer.mainContext
      Logger().info("init modelContainer")

      guard let urlApp = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask).last else { return }
      let url = urlApp.appendingPathComponent("default.store")
      if FileManager.default.fileExists(atPath: url.path) {
        Logger().info("swiftdata db at \(url.absoluteString)")
      } else {
        Logger().warning("can't find swiftdata db")
      }
    } catch {
      fatalError("Could not initialize ModelContainer")
    }
  }

  public func fetchItems() -> [Item] {
    do {
      let descriptor = FetchDescriptor<Item>()
      return try modelContext.fetch(descriptor)
    } catch {
      fatalError("Could not fetch items")
    }
  }

  public func addItem(name: String) {
    let item = Item(id: UUID(), name: name)
    modelContext.insert(item)
    try? modelContext.save()
  }
}
