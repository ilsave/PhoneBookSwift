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
        title = "AddContact"
        let attributes = [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Light", size: 17)!]
        UINavigationBar.appearance().titleTextAttributes = attributes
    }
    
    @IBAction func onClickCreateButton(_ sender: Any) {
        
        guard let viewController = viewController,
              let name = textNameField.text,
              let phoneNumber = phoneNumberFiled.text else {
            return
        }
        if (phoneNumber == "" || name == "" || !isValidPhone(phone: phoneNumber)){
            let alert = UIAlertController(title: ("Please enter valid data"), message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        viewController.newContact(nameLabel: name, phoneNumberLabel: phoneNumber)
        navigationController?.popToRootViewController(animated: true)
    }
    
    func isValidPhone(phone: String) -> Bool {
            let phoneRegex = "^[0-9+]{0,1}+[0-9]{5,16}$"
            let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
            return phoneTest.evaluate(with: phone)
        }
}
