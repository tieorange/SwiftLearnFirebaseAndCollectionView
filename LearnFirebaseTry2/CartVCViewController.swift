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
        UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    var productsList: [Product] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productsList.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell", for: indexPath) as? CartCell {
            let product = productsList[indexPath.row]
            cell.configureCell(product: product)
            return cell
        } else {
            return UITableViewCell()
        }
    }


}
