//
//  ViewController.swift
//  PhoneBook
//
//  Created by Gushchin Ilya on 18.03.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tableView:  UITableView!
    
    
    var footballPlayers = ["Muller",
                           "Messi",
                           "Alaba",
                           "Ilsave",
                           "Natural",
                           "Vdlaud",
                           "GreenToxic",
                           "Lewandowski",
                           "Goretska",
                           "Nouer",
                           "Kimmich"]
    
    struct Person {
        var nickName: String
        var number: String
        
        init(nickNamelabel nickName: String, numberLabel number: String) {
            self.nickName = nickName
            self.number = number
        }
    }
    
    class ContactGroup {
        var letter: Character
        var personList: [Person]
        
        init(letter: Character, personList: [Person] ) {
            self.letter = letter
            self.personList = personList
        }
    }
    
    var contactsGroup = [ContactGroup]()
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        title = "Contacts"
        contactsGroup = setUpContactsGroup()
    }

    func setUpContactsGroup() -> [ContactGroup]{
        var inList = [ContactGroup]()
        
        inList.append(ContactGroup.init(
                        letter: "A",
                        personList: [Person.init(nickNamelabel: "Anastasia" ,numberLabel: "+79200638388"),
                                     Person.init(nickNamelabel: "Angelina" ,numberLabel: "+79200638388"),
                                     Person.init(nickNamelabel: "Anna" ,numberLabel: "+79200638388"),
                                     Person.init(nickNamelabel: "Anton" ,numberLabel: "+79200638388"),
                                     Person.init(nickNamelabel: "Arcadiy" ,numberLabel: "+79200638388")
        ]))
        
        inList.append(ContactGroup.init(
                        letter: "B",
                        personList: [Person.init(nickNamelabel: "Boris" ,numberLabel: "+79200638388"),
                                     Person.init(nickNamelabel: "Brucks" ,numberLabel: "+79200638388"),
        ]))
        return inList
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if ( segue.identifier == "gotoAddContact") {
            print("i was there")
        } 
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("you tapped me !")
        print(footballPlayers[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
        
        //other approach
        //        let viewController = ChangeContactInfoViewController()
        //      //  viewController.personName.text = "qwq"
        //        navigationController?.pushViewController(viewController, animated: true)
        
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ChangeContactInfoViewController") as! ChangeContactInfoViewController
        vc.setVariables(textNameField: footballPlayers[indexPath.row], textPhoneNumberField: footballPlayers[indexPath.row])
        
        //  vc.personName.text = footballPlayers[indexPath.row]
        self.present(vc, animated: true, completion: nil)
    }
}

extension ViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return footballPlayers.count
    }
    
    //    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    //        //key of dic (massiv)
    //        <#code#>
    //    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        var letters = Set<Character>()
        for item in footballPlayers {
            letters.insert(item.character(at: 1) ?? "s")
        }
        return letters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = footballPlayers[indexPath.row]
        
        return cell
    }
}

extension String {
    
    func index(at position: Int, from start: Index? = nil) -> Index? {
        let startingIndex = start ?? startIndex
        return index(startingIndex, offsetBy: position, limitedBy: endIndex)
    }
    
    func character(at position: Int) -> Character? {
        guard position >= 0, let indexPosition = index(at: position) else {
            return nil
        }
        return self[indexPosition]
    }
}

