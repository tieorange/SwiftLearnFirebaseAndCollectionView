//
//  ViewController.swift
//  LearnFirebaseTry2
//
//  Created by Andrii Kovalchuk on 24/04/2017.
//  Copyright © 2017 Andrii Kovalchuk. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController:
        UIViewController,
        UICollectionViewDelegate,
        UICollectionViewDataSource,
        UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var menuCollectionView: UICollectionView!
    private var productsList = [Product]()
    private var ref: FIRDatabaseReference?

//    private var ref: FIRDatabaseReference
    override func viewDidLoad() {
        super.viewDidLoad()

        initFirebase()

        menuCollectionView.dataSource = self
        menuCollectionView.delegate = self

        /*productsList.append(getDummyProduct())
        productsList.append(getDummyProduct())
        productsList.append(getDummyProduct())*/
    }

    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productsList.count
    }

    private func initFirebase() {
        ref = FIRDatabase.database().reference()
        ref?.child("products").observe(.childAdded, with: { (snapshot) in
            let dictionary = snapshot.value as? [String: AnyObject] ?? [:]

            // TODO extract to constructor in Product(snapshot)
            let product = Product(
                    name: (dictionary["name"] as? String ?? ""),
                    price: dictionary["price"] as? Int ?? 0,
                    photoUrl: dictionary["photoUrl"] as? String ?? "")

            self.productsList.append(product)
            self.menuCollectionView.reloadData()
        })
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

    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("selected at \(indexPath)")
    }

    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 105, height: 105)
    }

    private func getDummyProduct() -> Product {
        return Product(name: "nalesnik z serem", price: 4, photoUrl: "http://static.ilewazy.pl/wp-content/uploads/nalesnik-z-serkiem1-130g.jpg")
    }

}

