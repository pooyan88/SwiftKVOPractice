//
//  ViewController.swift
//  KVO Training
//
//  Created by Pooyan J on 7/3/1402 AP.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var confirmButton: UIButton!
    @IBAction func confirmButtonAction(_ sender: Any) {
        confirmAction()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        NotificationCenter.default.addObserver(self, selector: #selector(updateLabel(notif:)), name: NSNotification.Name("shit"), object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name("shit"), object: nil)
    }
    
    @objc func updateLabel(notif: NSNotification) {
        dump(notif)
        label.text = (notif.object as? String) ?? "?"
    }
}

//MARK: - Setup Functions
extension FirstViewController {
    
    private func setupViews() {
        setupLabel()
        setupButton()
    }
    
    private func setupLabel() {
        label.text = "Enter Your Name"
        label.textAlignment = .center
    }
    
    private func setupButton() {
        confirmButton.titleLabel?.textAlignment = .center
        confirmButton.setTitle("->", for: .normal)
        confirmButton.layer.borderWidth = 1
        confirmButton.layer.borderColor = UIColor.link.cgColor
        confirmButton.tintColor = .link
    }
}

//MARK: - Actions
extension FirstViewController {
    
    private func confirmAction() {
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController {
            navigationController?.present(vc, animated: true)
        }
    }
}
