//
//  CartVCViewController.swift
//  LearnFirebaseTry2
//
//  Created by Andrii Kovalchuk on 01/05/2017.
//  Copyright © 2017 Andrii Kovalchuk. All rights reserved.
//

import UIKit

class CartVCViewController:
UIViewController,
UITableViewDelegate,
UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    
    var productsList : [Product]

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
    }


}
