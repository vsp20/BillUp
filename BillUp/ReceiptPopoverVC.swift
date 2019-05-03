//
//  ReceiptPopoverVC.swift
//  BillUp
//
//  Created by Vishal Patel on 5/3/19.
//  Copyright © 2019 VishalAndSteve. All rights reserved.
//

import UIKit

class ReceiptPopoverVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return(Global.sharedManager.userTotals.keys.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "receiptCell")
        print(Global.sharedManager.userTotals.keys.count)
        cell.textLabel?.text = Array(Global.sharedManager.userTotals.keys)[indexPath.row].name + String(Global.sharedManager.userTotals[Array(Global.sharedManager.userTotals.keys)[indexPath.row]]!)
        return (cell)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        Global.sharedManager.calculateTotals()

    }
    @IBAction func saveButtonPressed(_ sender: Any) {
        //insert screenshot code here
    }
    
    @IBAction func closePopup(_ sender: Any) {
        dismiss(animated: true, completion:nil)
    }
    

}
