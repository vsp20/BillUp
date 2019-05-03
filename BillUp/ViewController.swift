//
//  ViewController.swift
//  BillUp
//
//  Created by Vishal Patel on 4/24/19.
//  Copyright © 2019 VishalAndSteve. All rights reserved.
//

import UIKit



class Global{
    var personList: [String] = []
    var priceList: [String] = []
    var iList: [String] = []
    //Dictionary that represents the totals for all the people in the bill
    var userTotals: [Person: Double] = [:]
    
    // List of items in the current bill
    var items: [Item] = []
    
    func calculateTotals() {
        //remove all total info from userTotals map for recalculation
        for key in userTotals.keys{
            userTotals[key] = 0.00
        }
        
        for item in items {
            var peopleTotals: [Person: Double] = item.getPeopleTotals()
            for person in peopleTotals.keys {
                userTotals[person]! += peopleTotals[person]!
            }
        }
    }
    
    //Send text to input person. Example use: sendText(person.phoneNumber, userTotal[Person])
    func sendText(phoneNumber: String, price: Double){
        
    }
    
    //for add item we need to give a tuple with the person uid and
    func addItem(name: String, totalPrice: Double, people: [itemPerson]) {
        let item: Item = Item(name: name, totalPrice: totalPrice, people: people)
        items.append(item)
    }
    
    
    func addPerson(name: String, phoneNumber: String){
        let person: Person = Person(name: name, phoneNumber: phoneNumber)
        if !userTotals.keys.contains(person){
            userTotals[person] = 0.00
        }
    }
    
    class var sharedManager: Global{
        struct Static {
            static let instance = Global()
        }
        return Static.instance
        
    }
}


class Bill {
  
}

class Person: Hashable {
    var name: String
    var phoneNumber: String
    var hashValue: Int {
        return self.name.hashValue
    }
    
    static func ==(lhs: Person, rhs: Person) -> Bool {
        return lhs.name.hashValue == rhs.name.hashValue
    }
    
    init(name:String, phoneNumber: String){
        self.name = name
        self.phoneNumber = phoneNumber
    }
}

class Item {
    var name: String
    var totalPrice: Double
    var peopleTotals: [Person: Double] = [:]
    
    init(name: String, totalPrice: Double, people: [itemPerson]){
        self.name = name
        self.totalPrice = totalPrice
        
        //loop through people array to get people totals and store in dictionary
        for person in people {
            peopleTotals[person.person] = (person.multiplier/100) * totalPrice
        }
    }
    
    func getPeopleTotals() -> [Person: Double] {
        return self.peopleTotals
    }
}

// Represents the person and their corresponding multiplier from the add item view in the storyboard
class itemPerson{
    var person: Person
    //Multiplier must be between 1 and 100
    var multiplier: Double
    
    init(person: Person, multiplier: Double){
        self.person = person
        self.multiplier = multiplier
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

