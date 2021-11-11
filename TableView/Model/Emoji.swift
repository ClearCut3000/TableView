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
Emoji(symbol: "⭐️", name: "Звезда", description: "Желтая пятиконечная звезда", usage: "Отметить, когда что-то нравится"),
Emoji(symbol: "😀", name: "Улыбающийся", description: "Желтое улыбающееся доброжелательное лицо", usage: "Когда что-то смешное"),
Emoji(symbol: "👹", name: "Чудище", description: "На самом деле это - огр Намахагэ, который отгоняет злых духов", usage: "Когда повстречал что-либо чудовищное"),
Emoji(symbol: "👾", name: "Персонаж из игры  Space Invaders", description: "Фиолетовый пришелец", usage: "Когда что-то непонятное"),
Emoji(symbol: "🦑", name: "Кальмар", description: "Красный кальмар", usage: "Когда наступает кальмар"),
Emoji(symbol: "🌊", name: "Волна", description: "Напоминает ксилографию Большая волна у Канагавы японского художника Кацусики Хокусая", usage: "Вы на море?"),
Emoji(symbol: "🤓", name: "Смайлик-очкарик", description: "Желтое улыбающееся лицо в очках", usage: "Когда что-то смешное и умное"),
Emoji(symbol: "🌈", name: "Радуга", description: "Половина радуги", usage: "Когда радостно, весело и доброта"),
Emoji(symbol: "🤠", name: "Ковбой", description: "Желтый смайлик в ковбойской шляпе", usage: "Когда кто-то красавчик и крут"),
Emoji(symbol: "💃", name: "Она танцует", description: "Непринужденно пляшущяя дама", usage: "Когда пускаешься в пляс"),
Emoji(symbol: "🐯", name: "Тигр", description: "Просто тигр", usage: "Когда встретил тигра и выжил"),
Emoji(symbol: "🎋", name: "Дерево Танабата", description: "Дерево, к которому в разных религиях прикрепляют добрые пожелания", usage: "Пожелать чего-то хорошего оригинально"),
Emoji(symbol: "🎍", name: "Кадомацу", description: "Кадомацу — японское украшение, которое делается из бамбука или сосны", usage: "Поздравляете японца с Новым Годом!"),
    ]
  }
  static func loadAll() -> [Emoji]? {
return nil
  }

  static func loadDefaults() -> [Emoji] {
    return all
  }
}
