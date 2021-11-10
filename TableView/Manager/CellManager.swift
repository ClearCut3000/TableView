//
//  CellManager.swift
//  TableView
//
//  Created by Николай Никитин on 04.11.2021.
//

import Foundation
import UIKit
class CellManager {
  func configure(_ cell: EmojiCell, with emoji: Emoji) {
    cell.symbolLabel.text = emoji.symbol
    cell.nameLabel.text = emoji.name
    cell.descriptionLabel.text = emoji.descriotion
  }
}
