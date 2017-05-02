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
        UITableViewDataSource,
        DelegateRemovedFromCart {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var checkoutButton: CheckoutButtonView!

    var productsList: Array<Product>!
    var realm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()
        productsList = Array(realm.objects(Product.self))

        tableView.dataSource = self
        tableView.delegate = self
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }


    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productsList.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell", for: indexPath) as? CartCell {
            let product = productsList[indexPath.row]
            cell.configureCell(product: product)
            cell.nameLabel.tag = indexPath.row
            cell.delegateRemove = self
            return cell
        } else {
            return UITableViewCell()
        }
    }

    func productRemovedFromCart(index: Int) {
        let product: Product = self.productsList[index]
        try! realm.write{
            realm.delete(product)
        }
        self.productsList.remove(at: index)
        tableView.reloadData()
    }

    @IBAction func onClickCheckout(_ sender: UITapGestureRecognizer) {
        print("clicked")
        performSegue(withIdentifier: "OrderTrackingVC", sender: nil)
    }

}
