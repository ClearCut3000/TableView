//
//  AddEditTableViewController.swift
//  TableView
//
//  Created by Николай Никитин on 04.11.2021.
//

import UIKit

class AddEditTableViewController: UITableViewController {

  //MARK: - Outlets
  @IBOutlet var symbolTextField: UITextField!
  @IBOutlet var nameTextField: UITextField!
  @IBOutlet var descriptionTextField: UITextField!
  @IBOutlet var usageTextField: UITextField!
  @IBOutlet var saveBarButton: UIBarButtonItem!

  //MARK: - Properties
  var emoji = Emoji()
  var isEmoji = false
  var isContainingOther = false

  //MARK: - ViewDidLoad
  override func viewDidLoad() {
    super.viewDidLoad()
    textFieldWarcher()
    updateUI()
  }
  //MARK: - Methods
  private func checkIsEmoji(){
    guard let checkingText = symbolTextField.text else { return }
    isEmoji = checkingText.unicodeScalars.allSatisfy({$0.properties.isEmoji})
    print ("\(isEmoji)")
    isContainingOther = checkingText.unicodeScalars.allSatisfy({!$0.properties.isEmoji})
    print("\(isContainingOther)")
  }


  private func saveEmoji() {
    emoji.symbol = symbolTextField.text ?? ""
    emoji.name = nameTextField.text ?? ""
    emoji.descriotion = descriptionTextField.text ?? ""
    emoji.usage = usageTextField.text ?? ""
    UserDefaults.standard.removeObject(forKey: "name")
    UserDefaults.standard.removeObject(forKey: "symbol")
    UserDefaults.standard.removeObject(forKey: "usage")
    UserDefaults.standard.removeObject(forKey: "description")
    UserDefaults.standard.synchronize()
  }

  private func textFieldWarcher(){
    symbolTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
    nameTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
    descriptionTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
    usageTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
  }

  func storingUnsaved(){
    UserDefaults.standard.set(symbolTextField.text, forKey: "symbol")
    UserDefaults.standard.set(nameTextField.text, forKey: "name")
    UserDefaults.standard.set(descriptionTextField.text, forKey: "description")
    UserDefaults.standard.set(usageTextField.text, forKey: "usege")
  }

  @objc func textFieldDidChange(_ textField: UITextField){
    storingUnsaved()
    print(UserDefaults.standard.self)
    if symbolTextField.text!.isEmpty || nameTextField.text!.isEmpty || descriptionTextField.text!.isEmpty || usageTextField.text!.isEmpty {
      saveBarButton.isEnabled = false
    } else {
      checkIsEmoji()
      if isEmoji && !isContainingOther {
        saveBarButton.isEnabled = true
      } else {
        saveBarButton.isEnabled = false
      }
    }
  }

  private func updateUI() {
    if emoji.symbol != "" {
      symbolTextField.text = emoji.symbol
    } else {
      if let symbol = UserDefaults.standard.object(forKey: "symbol") as? String {
        symbolTextField.text = symbol
      } else { symbolTextField.text = emoji.symbol }
    }
    if emoji.name != "" {
      nameTextField.text = emoji.name
    } else {
      if let text = UserDefaults.standard.object(forKey: "name") as? String {
        nameTextField.text = text
      } else { nameTextField.text = emoji.name }
    }
    if emoji.descriotion != "" {
      descriptionTextField.text = emoji.descriotion
    } else {
      if let description = UserDefaults.standard.object(forKey: "description") as? String {
        descriptionTextField.text = description
      } else { descriptionTextField.text = emoji.descriotion }
    }
    if emoji.usage != "" {
      usageTextField.text = emoji.usage
    } else {
      if let usage = UserDefaults.standard.object(forKey: "usage") as? String {
        usageTextField.text = usage
      } else { usageTextField.text = emoji.usage}
    }
  }

  //MARK: - Navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    saveEmoji()
  }

}
