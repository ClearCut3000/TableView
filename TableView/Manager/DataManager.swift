//
//  DataManager.swift
//  TableView
//
//  Created by Николай Никитин on 14.11.2021.
//

import Foundation
import UIKit
class DataManager{
  var archiveURL: URL? {
    guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
    return documentDirectory.appendingPathComponent("emojis").appendingPathExtension("plist")
  }

  func loadEmojis() -> [Emoji]? {
    guard let archiveURL = archiveURL else { return nil }
    guard let encodedEmojis = try? Data(contentsOf: archiveURL) else { return nil }
    let decoder = PropertyListDecoder()
    return try? decoder.decode([Emoji].self, from: encodedEmojis )
  }

  func saveEmojis(_ emojis: [Emoji]){
    guard let archiveURL = archiveURL else { return }
    print(archiveURL)
    let encoder = PropertyListEncoder()
    guard let encodedEmojis = try? encoder.encode(emojis) else { return }
    try? encodedEmojis.write(to: archiveURL, options: .noFileProtection)
  }
}
