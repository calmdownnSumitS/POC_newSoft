//
//  DetailsVC.swift
//  POC_ABC
//
//  Created by Sumit_sharma on 18/04/21.
//

import UIKit

class DetailsVC: UIViewController {
    private var records : [Employee] = []
    @IBOutlet weak private var sTable : UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.get_localRecords()
        sTable.estimatedRowHeight = 100
        sTable.rowHeight = UITableView.automaticDimension

    }

    
    private func get_localRecords(){
        Employee.retrieve { (employers) in
            self.records = employers
            self.sTable.reloadData()
        }
    }

}
extension DetailsVC:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return records.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath) as! DetailCell
        cell.emp = records[indexPath.row]
        return cell
    }
    
    
}
