//
//  MenuCell.swift
//  LearnFirebaseTry2
//
//  Created by Andrii Kovalchuk on 25/04/2017.
//  Copyright © 2017 Andrii Kovalchuk. All rights reserved.
//

import UIKit
import Kingfisher
import AlamofireImage

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

        productName.text = self.product?.name.capitalized
        if let price = self.product?.price {
            productPrice.text = String(price)
        }
        let url = URL(string: product.photoUrl)!

//        productImage.kf.setImage(with: url, placehoder: "na")

        let url = Bundle.main.url(forResource: product.photoUrl)!
        let data = try! Data(contentsOf: url)
        let image = UIImage(data: data, scale: UIScreen.main.scale)!
        image.af_inflate()
        productImage.image = image
    }

}
