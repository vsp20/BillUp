//
//  pplListViewController.swift
//  BillUp
//
//  Created by Steven Barker on 5/1/19.
//  Copyright © 2019 VishalAndSteve. All rights reserved.
//

import UIKit

class pplListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return(Global.sharedManager.personList.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "CellP")
        cell.textLabel?.text = Global.sharedManager.personList[indexPath.row]
        return (cell)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        
        if editingStyle == UITableViewCell.EditingStyle.delete{
            Global.sharedManager.personList.remove(at: indexPath.row)
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
