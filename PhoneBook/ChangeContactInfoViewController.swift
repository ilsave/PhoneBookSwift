//
//  ChangeContactInfoViewController.swift
//  PhoneBook
//
//  Created by Gushchin Ilya on 20.03.2021.
//

import UIKit

class ChangeContactInfoViewController: UIViewController {
    
    
    var person: Person?
    var viewController: ViewController?
    var name: String?
    var number: String?
    @IBOutlet weak var personName: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    
    func setVariables(textNameField nameMain: String, textPhoneNumberField phoneNumberMain: String){
        self.name = nameMain
        self.number = phoneNumberMain
    }
    
    func setVariablePerson(person: Person){
        self.person = person
    }
    
    @IBAction func onClickChangeButton(_ sender: Any) {
        guard let name = personName.text,
              let number = phoneNumber.text,
              var person = person,
              let viewController = viewController  else {
            return
        }
        person.nickName = name
        person.number = number
        viewController.contactChanged(person: person)
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let person = person else {
            return
        }
        personName.text = person.nickName
        phoneNumber.text = person.number
    }
}
