//
//  ChangeContactInfoViewController.swift
//  PhoneBook
//
//  Created by Gushchin Ilya on 20.03.2021.
//

import UIKit

class ChangeContactInfoViewController: UIViewController {
    
    
    var name: String = "Unknown Error"
    var number: String = "Unknown Error"
    @IBOutlet weak var personName: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    
    func setVariables(textNameField nameMain: String, textPhoneNumberField phoneNumberMain: String){
        self.name = nameMain
        self.number = phoneNumberMain
    }
    
    override func viewWillAppear(_ animated: Bool) {
        personName.text = name
        phoneNumber.text = number
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      //  personName.text = name
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
