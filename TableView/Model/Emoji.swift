//
//  Emoji.swift
//  TableView
//
//  Created by Николай Никитин on 04.11.2021.
//

import Foundation
struct Emoji {
  var symbol: String
  var name: String
  var descriotion: String
  var usage: String
  init(symbol: String = "", name: String = "", description: String = "", usage: String = "") {
    self.symbol = symbol
    self.name = name
    self.descriotion = description
    self.usage = usage
  }
}
extension Emoji {
  static var all: [Emoji]{
    return [
Emoji(symbol: "😀", name: "Улыбающийся смайлик", description: "Желтое улыбающееся доброжелательное лицо", usage: "Когда что-то смешное"),
Emoji(symbol: "⭐️", name: "Звезда", description: "Желтая пятиконечная звезда", usage: "Отметить, когда что-то нравится"),
Emoji(symbol: "👹", name: "Чудище", description: "Красное чудище", usage: "Когда повстречал что-либо чудовищьное"),
Emoji(symbol: "👾", name: "Персонаж из игры SpaceWar", description: "Фиолетовый пришелец", usage: "Когда что-то непонятное"),
Emoji(symbol: "🦑", name: "Кальмар", description: "Красный кальмар", usage: "Когда наступает кальмар"),
Emoji(symbol: "🤓", name: "Смайлик-окарик", description: "Желтое улыбающееся лицо в очках", usage: "Когда уто-то смешное и умное"),
Emoji(symbol: "🌈", name: "Радуга", description: "Половина радуги", usage: "Когда рабостно, весело и доброта"),
    ]
  }
  static func loadAll() -> [Emoji]? {
return nil
  }

  static func loadDefaults() -> [Emoji] {
    return all
  }
}
