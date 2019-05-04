//
//  AddItemVC.swift
//  BillUp
//
//  Created by Vishal Patel on 4/25/19.
//  Copyright © 2019 VishalAndSteve. All rights reserved.
//

import UIKit

class AddItemVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate{
    
    @IBOutlet weak var itemPrice: UITextField!
    @IBOutlet weak var itemText: UITextField!
    
    
    @IBOutlet weak var dropdownTableview: UITableView!
    @IBOutlet weak var addPeopleButton: UIStackView!
    var personCounter = 0.0
    var itemPersonList: [itemPerson] = []

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        var allowedCharacters = CharacterSet.decimalDigits
        allowedCharacters.insert(".")
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemPrice.delegate = self
        dropdownTableview.reloadData()
    }
    
    
    
    func createAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message,preferredStyle:  UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction (title: "OK", style: UIAlertActionStyle.default, handler: {
            (action) in alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func addItemButton(_ sender: Any) {
        if(itemText.text != ""){
            Global.sharedManager.iList.append(itemText.text! + "      $" + itemPrice.text!)
            for itemPerson in itemPersonList {
                itemPerson.multiplier = 100.00 / personCounter
            }
            personCounter = 0.0
            Global.sharedManager.addItem(name: itemText.text!, totalPrice: Double(itemPrice.text!) as! Double, people: itemPersonList)
            Global.sharedManager.calculateTotals()
        }
        else{
//            let alert = UIAlertController(title: "Incomplete Form", message: "Each field must have something in them", preferredStyle: UIAlertControllerStyle.alert)
//            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {
//                (action) in alert.dismiss(animated: true, completion: nil)
//            }))
//            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func closePopup(_ sender: Any) {
        dismiss(animated: true, completion:nil)
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return(Global.sharedManager.userTotals.keys.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "peopleCell")
        print(Global.sharedManager.userTotals.keys.count)
        cell.textLabel?.text = Array(Global.sharedManager.userTotals.keys)[indexPath.row].name
        return (cell)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let personAdded = Array(Global.sharedManager.userTotals.keys)[indexPath.row]
        itemPersonList.append(itemPerson(person:personAdded, multiplier: 0))
        personCounter = personCounter + 1.0
        createAlert(title: "Update", message: personAdded.name + "has been added to the bill")
        print("item has been added to item person list")
    }
    
    
}


//extension AddItemVC: UITableViewDelegate, UITableViewDataSource {
//
//}

