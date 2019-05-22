//
//  AgendaTableViewController.swift
//  CleanNetworkFramework
//
//  Created by Qingzhen Han on 2019-05-21.
//  Copyright © 2019 Qingzhen Han. All rights reserved.
//

import UIKit

class AgendaTableViewController: UITableViewController {
    
    private var itemList = ["Comic View","Guest List","Next"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Agenda"
        tableView.contentInset = UIEdgeInsets(top: 20.0, left: 0.0, bottom: 0.0, right: 0.0)
        tableView.tableFooterView = UIView()
        tableView.reloadData()
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemList.count
    }
    

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "tableViewCellIdentifier") as! TableViewCell
        let item = itemList[indexPath.row]
        cell.titleLabel.numberOfLines = 0
        cell.titleLabel.text = item
        cell.titleLabel.textColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ComicListViewController") as? ComicListViewController
            if vc != nil{
                self.navigationController?.pushViewController(vc!, animated: true)
            }
            
            break
        case 1:
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ComicListViewController") as? ComicListViewController
            if vc != nil{
                self.navigationController?.pushViewController(vc!, animated: true)
            }
            break
        default:
            showAlert(title: "Oops", message: "The new item is coming!")
            break
        }
        
        
        print("click item: \(itemList[indexPath.row])")
    }
    
    func showAlert(title:String, message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
    }


}
