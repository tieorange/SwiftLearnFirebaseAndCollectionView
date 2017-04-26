//
//  MenuCell.swift
//  LearnFirebaseTry2
//
//  Created by Andrii Kovalchuk on 25/04/2017.
//  Copyright © 2017 Andrii Kovalchuk. All rights reserved.
//

import UIKit

import Kingfisher

//import AlamofireImage
//import SDWebImage

class MenuCell: UICollectionViewCell {

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productAmount: UILabel!
    private var product: Product?

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.cornerRadius = 6.0
    }


    func configureCell(product: Product) {
        self.product = product

        productName.text = self.product?.name.capitalized
        if let price = self.product?.price {
            productPrice.text = String(price.toPriceString())
        }
        let url = URL(string: product.photoUrl)!

        productImage.kf.setImage(with: url)

        if (product.amount > 0) {
            productAmount.alpha = 1
            productAmount.text = String(product.amount)
        } else {
            productAmount.alpha = 0
        }

//        productImage.sd_setImage(with: url, placeholderImage: UIImage(named: "placeholder.png"))
    }

}
