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

    @IBOutlet weak var menuCollectionView: UICollectionView!
    @IBOutlet weak var orderSum: UILabel!
    private var productsList = [Product]()
    private var ref: FIRDatabaseReference?
    private let realm = try! Realm()
    private var lastOpenedIndex = -1
    // TODO: save to userDefaults

    override func viewDidLoad() {
        super.viewDidLoad()

        initFirebase()

        menuCollectionView.dataSource = self
        menuCollectionView.delegate = self
        orderSum.isHidden = true
    }

    private func initFirebase() {
        let database = FIRDatabase.database()
        database.persistenceEnabled = true
        ref = database.reference()
        ref?.keepSynced(true)
        ref?.child("products").observe(.childAdded, with: { (snapshot) in
            let dictionary = snapshot.value as? [String: AnyObject] ?? [:]

            // TODO extract to constructor in Product(snapshot)
            let product = Product(
                    name: (dictionary["name"] as? String ?? ""),
                    price: dictionary["price"] as? Int ?? 0,
                    photoUrl: dictionary["photoUrl"] as? String ?? "")

            product.amount = ProductsModel.getAmountByPrimaryKey(primaryKey: product.name, realm: self.realm)
            if (product.amount > 0) {
                self.refreshOrderSum()
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
            cell.productName.tag = indexPath.item
            return cell
        } else {
            return UICollectionViewCell()
        }
    }

    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        lastOpenedIndex = indexPath.item
        let product = productsList[indexPath.item]
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
                    detailsVC.product = product
                }
            }
        } else if(segue.identifier == "CartVC"){
            if let cartVC = segue.destination as? CartVC{
                if let product = sender as? [Product]{
//                    cartVC.productsList
                }
            }
        }
    }

    func writeValueBack(amount: Int, productIndex: Int) {
        if (productIndex >= 0) {
            let selectedProduct = productsList[productIndex]

            try! realm.write {
                selectedProduct.amount = amount
                realm.add(selectedProduct, update: true)
            }

            let allProducts = realm.objects(Product.self)
            print("Products in a cart \(allProducts)")

            self.menuCollectionView.reloadData()
            refreshOrderSum()
        }
    }

    func refreshOrderSum() {
        var sum = 0.0
        var isAnyProductAdded = false
        productsList.forEach {
            if ($0.amount > 0) {
                sum += $0.moneyWithCents * Double($0.amount)
                isAnyProductAdded = true
            }
        }

        if (isAnyProductAdded) {
            orderSum.text = "\(sum)0"
            orderSum.isHidden = false
        } else {
            orderSum.isHidden = true
        }
    }

}

