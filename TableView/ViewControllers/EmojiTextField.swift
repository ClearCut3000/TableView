//
//  EmojiTextField.swift
//  TableView
//
//  Created by Николай Никитин on 11.11.2021.
//

import UIKit

class EmojiTextField: UITextField {
  override var textInputContextIdentifier: String? { "" }
  override var textInputMode: UITextInputMode?{
    for mode in UITextInputMode.activeInputModes {
      if mode.primaryLanguage == "emoji" {
      return mode
      }
    }
    return nil
  }
  override init(frame: CGRect){
    super.init(frame: frame)
    commonInit()
  }
  required init?(coder: NSCoder){
    super.init(coder: coder)
    commonInit()
  }
  func commonInit() {
    NotificationCenter.default.addObserver(self, selector: #selector(inputModeDidChange), name: UITextInputMode.currentInputModeDidChangeNotification, object: nil)
  }
  @objc func inputModeDidChange(_ notification: Notification){
    guard isFirstResponder else {
      return
    }
    DispatchQueue.main.async {
      [weak self] in
      self?.reloadInputViews()
    }
  }
}
