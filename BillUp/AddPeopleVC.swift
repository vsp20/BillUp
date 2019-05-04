//
//  AddPeopleVC.swift
//  BillUp
//
//  Created by Vishal Patel on 4/24/19.
//  Copyright © 2019 VishalAndSteve. All rights reserved.
//

import UIKit

class AddPeopleVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var nameText: UITextField!
    
    
    @IBOutlet weak var numberText: UITextField!
    
    
    func createAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message,preferredStyle:  UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction (title: "OK", style: UIAlertActionStyle.default, handler: {
            (action) in alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func addPersonButton(_ sender: Any) {
        if(nameText.text != ""){
            if (Global.sharedManager.addPerson(name: nameText.text!, phoneNumber: numberText.text!)){
                Global.sharedManager.personList.append(nameText.text! + "   Phone #:  " + numberText.text!)
                }
            else{
            createAlert(title: "Error", message: nameText.text! + " already exists")
            }

        }
    }
    
    @IBAction func closePopup(_ sender: Any) {
        dismiss(animated: true, completion:nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
