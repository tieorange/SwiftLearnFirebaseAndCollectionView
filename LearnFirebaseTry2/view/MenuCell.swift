//
//  MenuCell.swift
//  LearnFirebaseTry2
//
//  Created by Andrii Kovalchuk on 25/04/2017.
//  Copyright © 2017 Andrii Kovalchuk. All rights reserved.
//

import UIKit

class MenuCell: UICollectionViewCell {

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    private var product: Product?

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.cornerRadius = 15.0
    }


    func configureCell(product: Product) {
        self.product = product

        productImage.image = UIImage(named: "nalesnik")
        productName.text = self.product?.name.capitalized
        if let price = self.product?.price {
            productPrice.text = String(price)
        }
    }

}
