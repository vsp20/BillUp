//
//  AddItemVC.swift
//  BillUp
//
//  Created by Vishal Patel on 4/25/19.
//  Copyright © 2019 VishalAndSteve. All rights reserved.
//

import UIKit

class AddItemVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBOutlet weak var itemText: UITextField!
    
    @IBOutlet weak var itemPrice: UITextField!
    
    @IBAction func addItemButton(_ sender: Any) {
        if(itemText.text != ""){
            Global.sharedManager.iList.append(itemText.text! + "  -  " + itemPrice.text!)
            itemText.text = ""
        }
    }
    
    
    @IBAction func closePopup(_ sender: Any) {
        dismiss(animated: true, completion:nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}
