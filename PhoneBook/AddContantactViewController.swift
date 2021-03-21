//
//  AddContantactViewController.swift
//  PhoneBook
//
//  Created by Gushchin Ilya on 19.03.2021.
//

import UIKit

class AddContantactViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add contact"
        let attributes = [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Light", size: 17)!]
        UINavigationBar.appearance().titleTextAttributes = attributes
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onClickCreateButton(_ sender: Any) {
        //self.navigationController?.popViewController(animated: true)
        //self.dismiss(animated: true, completion: nil)
        navigationController?.popToRootViewController(animated: true)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "gotoBackContactList"){
           // self.dismiss(animated: false, completion: nil)
           // self.navigationController?.popViewController(animated: true)
            print("found!")
        }
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
