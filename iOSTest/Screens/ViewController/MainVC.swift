//
//  ViewController.swift
//  iOSTest
//
//  Created by abdul on 27/03/20.
//  Copyright © 2020 abdul. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var tableview1: UITableView!
    @IBOutlet weak var tableView2: UITableView!
    
    let viewModel = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDataSourceAndDelegate()
        setupXibs()
    }
    
    private func setupDataSourceAndDelegate() {
        viewModel.dataDelegate = self
        
        tableview1.delegate = self
        tableview1.dataSource = self
        
        tableView2.delegate = self
        tableView2.dataSource = self
        
        viewModel.populateData()
        
    }
    
    private func setupXibs() {
        tableview1.register(UserCell.nib, forCellReuseIdentifier: UserCell.identifier)
        tableView2.register(UserCell.nib, forCellReuseIdentifier: UserCell.identifier)
    }


}
extension MainVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count:Int?
        if tableView == self.tableview1 {
            count = viewModel.table1Data.count
        }
        
        if tableView == self.tableView2 {
            count = viewModel.table2Data.count
        }
        return count ?? 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var userCell: UserCell?
        
        if tableView == self.tableview1 {
            let data = viewModel.table1Data[indexPath.row]
            userCell = tableView.dequeueReusableCell(withIdentifier: UserCell.identifier) as? UserCell
            userCell?.setupDataWith(source: data)
        }
        
        if tableView == self.tableView2 {
            let data = viewModel.table2Data[indexPath.row]
            userCell = tableView.dequeueReusableCell(withIdentifier: UserCell.identifier) as? UserCell
            userCell?.setupDataWith(source: data)
        }
        
        return userCell ?? UITableViewCell()
    }
    

}

extension MainVC: DataDelegate {
    func didFinish() {
        tableview1.reloadData()
        tableView2.reloadData()
    }
}

