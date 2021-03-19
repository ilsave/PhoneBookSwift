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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        title = "Contacts"
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("you tapped me !")
        print(footballPlayers[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
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
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = footballPlayers[indexPath.row]
        
        return cell
    }
}

