//
//  ViewController.swift
//  LearnFirebaseTry2
//
//  Created by Andrii Kovalchuk on 24/04/2017.
//  Copyright © 2017 Andrii Kovalchuk. All rights reserved.
//

import UIKit
import FirebaseDatabase
import RealmSwift

class ViewController:
        UIViewController,
        UICollectionViewDelegate,
        UICollectionViewDataSource,
        UICollectionViewDelegateFlowLayout,
        writeValueBackDelegate {

    @IBOutlet weak var checkoutButton: CheckoutButtonView!
    @IBOutlet weak var menuCollectionView: UICollectionView!
    private var lastOpenedCellIndex = -1
    private var productsList = [Product]()
    private var ref: FIRDatabaseReference?
    private let realm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()

        initFirebase()

        menuCollectionView.dataSource = self
        menuCollectionView.delegate = self
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        refreshSumAndAmount()
    }


    private func initFirebase() {
        let database = FIRDatabase.database()
        database.persistenceEnabled = true
        ref = database.reference()
        ref?.keepSynced(true)
        ProductsModel.removeProductsWithZeroAmount(realm: realm)

        ref?.child("products").observe(.childAdded, with: { (snapshot) in
            let dictionary = snapshot.value as? [String: AnyObject] ?? [:]

            // TODO extract to constructor in Product(snapshot)
            let product = Product(
                    name: (dictionary["name"] as? String ?? ""),
                    price: dictionary["price"] as? Int ?? 0,
                    photoUrl: dictionary["photoUrl"] as? String ?? "")

            product.amount = ProductsModel.getAmountByPrimaryKey(primaryKey: product.name, realm: self.realm)
            if (product.amount > 0) {
                self.refreshSumAndAmount()
            }

            self.productsList.append(product)
            self.menuCollectionView.reloadData()
        })
    }

    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productsList.count
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuCell", for: indexPath) as? MenuCell {
            let product = productsList[indexPath.item]
            cell.configureCell(product: product)
            return cell
        } else {
            return UICollectionViewCell()
        }
    }

    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let product = productsList[indexPath.item]
        lastOpenedCellIndex = indexPath.item
        performSegue(withIdentifier: "ProductDetail", sender: product)
    }

    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width / 2.2
        return CGSize(width: width, height: 125.0)
    }

    @IBAction func onClickCheckout(_ sender: UITapGestureRecognizer) {
        let inCart = realm.objects(Product.self)
        performSegue(withIdentifier: "CartVC", sender: inCart)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "ProductDetail") {
            if let detailsVC = segue.destination as? ProductDetailVC {
                if let product = sender as? Product {
                    detailsVC.delegate = self
                    detailsVC.cellIndex = lastOpenedCellIndex
                    detailsVC.product = product
                }
            }
        }
    }

    func writeValueBack() {
        refreshSumAndAmount()
    }

    func refreshSumAndAmount() {
        try! realm.write {
            productsList.forEach {
                $0.amount = ProductsModel.getAmountByPrimaryKey(primaryKey: $0.name, realm: realm)
            }
        }

        self.menuCollectionView.reloadData()
        checkoutButton.refreshData(ProductsModel.getAllProductsInCart(realm: realm))
    }

}

