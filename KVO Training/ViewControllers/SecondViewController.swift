//
//  SecondViewController.swift
//  KVO Training
//
//  Created by Pooyan J on 7/3/1402 AP.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var confirmButton: UIButton!
    @IBAction func confirmButtonAction(_ sender: Any) {
        if isTextValid {
            confirmAction()
        }
    }
    
    var isTextValid: Bool = false
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
}

//MARK: - Setup Views
extension SecondViewController {
    
    private func setupViews() {
        setupTextField()
        setupConfirmButton()
    }
    
    private func setupTextField() {
        textField.delegate = self
        textField.textAlignment = .center
        textField.textColor = .black
    }
    
    private func setupConfirmButton() {
            confirmButton.setTitle("<-", for: .normal)
            confirmButton.layer.borderWidth = 1
            confirmButton.layer.borderColor = UIColor.link.cgColor
        }
}

//MARK: - Setup Actions
extension SecondViewController {
    
    private func confirmAction() {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
}

//MARK: - TextField Delegate
extension SecondViewController: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if let text = textField.text, text.count > 0 {
            isTextValid = true
            NotificationCenter.default.post(name: NSNotification.Name("shit"), object: text)
        } else {
            isTextValid = false
        }
    }
}
