//
//  MyWidgetExtentionBundle.swift
//  MyWidgetExtention
//
//  Created by djzhu on 2024/8/14.
//

import AppIntents
import OSLog
import Shared
import SwiftUI
import WidgetKit

@main
struct MyWidgetExtentionBundle: WidgetBundle {
  @MainActor
  init() {
    Logger().info("MyWidgetExtentionBundle init")
    let sc = StorageController.globalInstance

    AppDependencyManager.shared.add(dependency: sc)
  }

  var body: some Widget {
    MyWidgetExtention()
  }
}
