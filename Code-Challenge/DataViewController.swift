//
//  DataViewController.swift
//  Code-Challenge
//
//  Created by Helios on 25/07/20.
//  Copyright © 2020 Axxess. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class DataViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    let contactsTableView = UITableView()
    var dataArray = [CodeChallengeModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Link Data"
        view.backgroundColor = .white
        view.addSubview(contactsTableView)
        let request = AF.request("https://raw.githubusercontent.com/AxxessTech/Mobile-Projects/master/challenge.json")
          // 2
          request.responseJSON { (response) in
            print(response.result)
            if let json = response.data
            {
                do{
                    let data = try JSON(data: json)
                    for item in data.arrayObject! {
                         let obj: CodeChallengeModel = CodeChallengeModel.init(fromDictionary: item as! [String : Any])
                         self.dataArray.append(obj);
                    }
                    self.contactsTableView.reloadData()
                }
                catch{
                print("JSON Error")
                }
            }
          }
        
        contactsTableView.tableFooterView = UIView()
        contactsTableView.translatesAutoresizingMaskIntoConstraints = false
        
        contactsTableView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor).isActive = true
        contactsTableView.leftAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leftAnchor).isActive = true
        contactsTableView.rightAnchor.constraint(equalTo:view.safeAreaLayoutGuide.rightAnchor).isActive = true
        contactsTableView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        contactsTableView.dataSource = self
        contactsTableView.delegate = self
        
        contactsTableView.register(DataTableViewCell.self, forCellReuseIdentifier: "dataCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell", for: indexPath) as! DataTableViewCell
        let cObject = self.dataArray[indexPath.row];
        cell.nameLabel.text = cObject.id
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cObject: CodeChallengeModel = self.dataArray[indexPath.row];
        let view = DetailViewController()
        view.dataObject = cObject
        self.navigationController?.pushViewController(view, animated: true)
    }
}


