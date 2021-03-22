//
//  ChangeContactInfoViewController.swift
//  PhoneBook
//
//  Created by Gushchin Ilya on 20.03.2021.
//

import UIKit

class ChangeContactInfoViewController: UIViewController {
    
    
    var person: Person?
    weak var delegate: ContactDelegate?
    var name: String?
    var number: String?
    @IBOutlet weak var personName: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    
    
    func setVariablePerson(person: Person){
        self.person = person
    }
    
    @IBAction func onClickChangeButton(_ sender: Any) {
        guard let name = personName.text,
              let number = phoneNumber.text,
              var person = person,
              let delegate = delegate  else {
            return
        }
        person.nickName = name
        person.number = number
        delegate.contactChanged(person: person)
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
