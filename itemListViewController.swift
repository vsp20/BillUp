//
//  BillViewController.swift
//  BillUp
//
//  Created by Steven Barker on 5/1/19.
//  Copyright © 2019 VishalAndSteve. All rights reserved.
//

import UIKit

class Global{
    var iList = ["test 1", "test 2", "test 3"]
    var personList = ["test p1", "test p2", "test p3"]
    var priceList = ["price1", "price2", "price3"]
    
    class var sharedManager: Global{
        struct Static {
            static let instance = Global()
        }
        return Static.instance
        
    }
}

class itemListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return(Global.sharedManager.iList.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        cell.textLabel?.text = Global.sharedManager.iList[indexPath.row]
        return (cell)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        
        if editingStyle == UITableViewCell.EditingStyle.delete{
            Global.sharedManager.iList.remove(at: indexPath.row)
            myTableView.reloadData()
        }
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        myTableView.reloadData()
    }

    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
