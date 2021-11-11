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
  func updateUI() {
    symbolTextField.text = emoji.symbol
    nameTextField.text = emoji.name
    descriptionTextField.text = emoji.descriotion
    usageTextField.text = emoji.usage
  }

  func checkIsEmoji(){
    guard let checkingText = symbolTextField.text else { return }
    isEmoji = checkingText.unicodeScalars.allSatisfy({$0.properties.isEmoji})
    print ("\(isEmoji)")
    isContainingOther = checkingText.unicodeScalars.allSatisfy({!$0.properties.isEmoji})
    print("\(isContainingOther)")
  }

  func saveEmoji() {
    emoji.symbol = symbolTextField.text ?? ""
    emoji.name = nameTextField.text ?? ""
    emoji.descriotion = descriptionTextField.text ?? ""
    emoji.usage = usageTextField.text ?? ""
  }

  func textFieldWarcher(){
    symbolTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
    nameTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
    descriptionTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
    usageTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
  }

  @objc func textFieldDidChange(_ textField: UITextField){
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

  //MARK: - Navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    saveEmoji()
  }

}
