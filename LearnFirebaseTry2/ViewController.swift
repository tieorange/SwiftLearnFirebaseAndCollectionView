//
//  ViewController.swift
//  LearnFirebaseTry2
//
//  Created by Andrii Kovalchuk on 24/04/2017.
//  Copyright © 2017 Andrii Kovalchuk. All rights reserved.
//

import UIKit

class ViewController:
        UIViewController,
        UICollectionViewDelegate,
        UICollectionViewDataSource,
        UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var menuCollectionView: UICollectionView!
    private var productsList = [Product]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        productsList.append(getDummyProduct())
        productsList.append(getDummyProduct())
        productsList.append(getDummyProduct())
        
        menuCollectionView.dataSource = self
        menuCollectionView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productsList.count
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuCell", for: indexPath) as? MenuCell {
//            let product = productsList.get
//            cell.configureCell(product: product)
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
        return Product(name: "nalesnik z serem", price: 4)
    }

}

