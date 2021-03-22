//
//  ViewController.swift
//  PhoneBook
//
//  Created by Gushchin Ilya on 18.03.2021.
//

import UIKit

struct Person {
    var id: Int
    var nickName: String
    var number: String
    
    init(id: Int, nickNamelabel nickName: String, numberLabel number: String) {
        self.id = id
        self.nickName = nickName
        self.number = number
    }
}

class ContactGroup {
    var letter: String
    var personList: [Person]
    
    init(letter: String, personList: [Person] ) {
        self.letter = letter
        self.personList = personList
    }
}

struct Call {
    var toWho: String
    var time: String
}



class ViewController: UIViewController {
    
    @IBOutlet var tableView:  UITableView!
    
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
                        personList: [Person.init(id: 1, nickNamelabel: "Anastasia" ,numberLabel: "89200638388"),
                                     Person.init(id: 2, nickNamelabel: "Angelina" ,numberLabel: "+79200638388"),
                                     Person.init(id: 3, nickNamelabel: "Anna" ,numberLabel: "+79200638388"),
                                     Person.init(id: 4, nickNamelabel: "Anton" ,numberLabel: "+79200638388"),
                                     Person.init(id: 5, nickNamelabel: "Arcadiy" ,numberLabel: "+79200638388")
                        ]))
        
        inList.append(ContactGroup.init(
                        letter: "B",
                        personList: [Person.init(id: 6, nickNamelabel: "Boris" ,numberLabel: "+79200638388"),
                                     Person.init(id: 7, nickNamelabel: "Brucks" ,numberLabel: "+79200638388"),
                        ]))
        return inList
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "gotoAddContact") {
            print("i was there")
            let destination = segue.destination as! AddContantactViewController
            destination.viewController = self
        } 
    }
    
    open func newContact(nameLabel name: String, phoneNumberLabel phoneNumber: String){
        print(" New contact \(name), \(phoneNumber)")
        
        var count = 0
        for indexLetter in 0..<contactsGroup.count {
            for _ in 0..<contactsGroup[indexLetter].personList.count{
                count = count + 1
            }
        }
        
        var bol = false
        for indexLetter in 0..<contactsGroup.count {
            if (contactsGroup[indexLetter].letter == name.prefix(1)){
                bol = true
                contactsGroup[indexLetter].personList.append(Person.init(id: count + 1, nickNamelabel: name ,numberLabel: phoneNumber))
            }
        }
        if (bol == false){
            contactsGroup.append(ContactGroup.init(letter: String(name.prefix(1)), personList: [Person.init(id: count + 1, nickNamelabel: name ,numberLabel: phoneNumber)]))
        }
        self.tableView.reloadData()
    }
    
    
    func contactChanged(person: Person) {
        let id = person.id
        
        for indexLetter in 0..<contactsGroup.count {
            for indexContact in 0..<contactsGroup[indexLetter].personList.count{
                print(contactsGroup[indexLetter].personList[indexContact])
            }
        }
        
        for indexLetter in 0..<contactsGroup.count {
            for indexContact in 0..<contactsGroup[indexLetter].personList.count{
                if (id == contactsGroup[indexLetter].personList[indexContact].id){
                    contactsGroup[indexLetter].personList[indexContact].nickName = person.nickName
                    contactsGroup[indexLetter].personList[indexContact].number = person.number
                }
            }
        }
        
        
        for indexLetter in 0..<contactsGroup.count {
            for indexContact in 0..<contactsGroup[indexLetter].personList.count{
                print(contactsGroup[indexLetter].personList[indexContact])
            }
        }
        
        self.tableView .reloadData()
    }
    
    func sortChangedData(){
        
    }
    
}


extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        if let phoneURL = NSURL(string: ("tel://" + contactsGroup[indexPath.section].personList[indexPath.row].number)) {
            
            let alert = UIAlertController(title: ("Call " + contactsGroup[indexPath.section].personList[indexPath.row].number + "?"), message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Call", style: .default, handler: { (action) in
                UIApplication.shared.open(phoneURL as URL, options: [:], completionHandler: nil)
            }))
            
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        let now = Date()
        
        let formatter = DateFormatter()
        
        formatter.timeZone = TimeZone.current
        
        formatter.dateFormat = "HH:mm"
        
        let dateString = formatter.string(from: now)
        CallingListViewController.callingList.append(Call.init(toWho: contactsGroup[indexPath.section].personList[indexPath.row].nickName, time: dateString))
        
    }
    
}


extension ViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactsGroup[section].personList.count
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return contactsGroup.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = contactsGroup[indexPath.section].personList[indexPath.row].nickName
        
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return contactsGroup[section].letter
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .normal, title: "Delete") { (action, view, completionHandler) in
            completionHandler(true)
            self.contactsGroup[indexPath.section].personList.remove(at: indexPath.row)
            self.tableView.reloadData()
        }
        delete.image = UIImage(systemName: "trash")
        delete.backgroundColor = .red
        
        let change = UIContextualAction(style: .normal, title: "Change") { (action, view, completionHandler) in
            completionHandler(true)
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ChangeContactInfoViewController") as! ChangeContactInfoViewController
            vc.viewController = self
            vc.setVariablePerson(person: Person.init(id: self.contactsGroup[indexPath.section].personList[indexPath.row].id,
                                                     nickNamelabel: self.contactsGroup[indexPath.section].personList[indexPath.row].nickName,
                                                     numberLabel: self.contactsGroup[indexPath.section].personList[indexPath.row].number))
            self.present(vc, animated: true, completion: nil)
        }
        change.image = UIImage(systemName: "pencil")
        change.backgroundColor = .blue
        
        let swipe = UISwipeActionsConfiguration(actions: [delete, change])
        return swipe
    }
}
