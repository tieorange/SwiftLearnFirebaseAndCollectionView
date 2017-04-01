//
//  CartVC.swift
//  LearnFirebaseTry2
//
//  Created by Andrii Kovalchuk on 01/05/2017.
//  Copyright © 2017 Andrii Kovalchuk. All rights reserved.
//

import UIKit
import RealmSwift

class CartVC:
        UIViewController,
        UITableViewDelegate,
        UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var checkoutButton: CheckoutButton!
    
    var productsList: Results<Product>!
    var realm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()
        productsList = realm.objects(Product.self)

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
            cell.nameLabel.tag = indexPath.row
            return cell
        } else {
            return UITableViewCell()
        }
    }


}
