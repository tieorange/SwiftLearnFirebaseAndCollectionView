//
//  CheckoutButtonView.swift
//  LearnFirebaseTry2
//
//  Created by Andrii Kovalchuk on 01/05/2017.
//  Copyright © 2017 Andrii Kovalchuk. All rights reserved.
//

import UIKit
import RealmSwift

class CheckoutButtonView: UIView {

    @IBOutlet var view: UIView!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var amount: UILabel!

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        Bundle.main.loadNibNamed("CheckoutButtonView", owner: self, options: nil)
        self.addSubview(self.view)
    }

    public func setPrice(price: Int) {
        if (price > 0) {
            self.price.text = price.toPriceString()
            self.view.isHidden = false
        } else {
            self.view.isHidden = true
        }
    }

    public func setAmount(amount: Int) {
        self.amount.text = "(\(amount))"
    }

    func refreshData(_ productsInCart: RealmSwift.Results<Product>) {
        var sumAmount = 0
        var sumPrice = 0
        productsInCart.forEach {
            sumAmount += $0.amount
            sumPrice += $0.price
        }

        setPrice(price: sumPrice)
        setAmount(amount: sumAmount)
    }
}
