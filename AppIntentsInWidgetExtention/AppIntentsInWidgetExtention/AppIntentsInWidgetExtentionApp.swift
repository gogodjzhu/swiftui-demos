//
//  AppIntentsInWidgetExtentionApp.swift
//  AppIntentsInWidgetExtention
//
//  Created by djzhu on 2024/8/14.
//

import Shared
import SwiftUI

@main
struct AppIntentsInWidgetExtentionApp: App {
  @State
  private var storageController: StorageController

  init() {
    let sc = StorageController.globalInstance
    storageController = sc
  }

  var body: some Scene {
    WindowGroup {
      VStack {
        Text("Total item cnt:\(storageController.fetchItems().count)")
        Button("Add Item") {
          storageController.addItem(name: "Item-\(UUID().uuidString)")
        }
      }
    }
  }
}
