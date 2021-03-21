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
    var name: String = "Unknown Error"
    var number: String = "Unknown Error"
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
        guard let name = personName.text, let number = phoneNumber.text else {
            return
        }
        person?.nickName = personName.text ?? "Error"
        person?.number = phoneNumber.text ?? "Error"
        viewController?.contactChanged(person: person!)
        self.dismiss(animated: true, completion: nil)
        //navigationController?.popToRootViewController(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        personName.text = person?.nickName
        phoneNumber.text = person?.number
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      //  personName.text = name
        // Do any additional setup after loading the view.
    }

}
