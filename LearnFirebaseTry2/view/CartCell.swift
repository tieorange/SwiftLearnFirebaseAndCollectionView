//
//  CartCell.swift
//  LearnFirebaseTry2
//
//  Created by Andrii Kovalchuk on 01/05/2017.
//  Copyright © 2017 Andrii Kovalchuk. All rights reserved.
//

import UIKit

class CartCell: UITableViewCell {

    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!

    var product: Product!

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = UITableViewCellSelectionStyle.none
        // Initialization code
    }

    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        amountLabel.text = "\(Int(stepper.value))"
    }

    func configureCell(product: Product) {
        self.product = product

        amountLabel.text = "\(product.amount)"
        stepper.value = Double(product.amount)
        priceLabel.text = "\(product.moneyWithCentsString)"
        nameLabel.text = product.name
        nameLabel.sizeToFit()
    }

}
