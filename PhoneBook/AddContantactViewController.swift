//
//  AddContantactViewController.swift
//  PhoneBook
//
//  Created by Gushchin Ilya on 19.03.2021.
//

import UIKit

class AddContantactViewController: UIViewController {
    
    var viewController: ViewController?
    @IBOutlet var textNameField: UITextField!
    @IBOutlet var phoneNumberFiled: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add contact"
        let attributes = [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Light", size: 17)!]
        UINavigationBar.appearance().titleTextAttributes = attributes
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onClickCreateButton(_ sender: Any) {
        viewController?.newContact(nameLabel: textNameField.text ?? "Error", phoneNumberLabel: phoneNumberFiled.text ?? "Error")
        navigationController?.popToRootViewController(animated: true)
    }
}
