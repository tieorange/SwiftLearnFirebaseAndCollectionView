//
//  ProductDetailVC.swift
//  LearnFirebaseTry2
//
//  Created by Andrii Kovalchuk on 26/04/2017.
//  Copyright © 2017 Andrii Kovalchuk. All rights reserved.
//

import UIKit
import Kingfisher
import RealmSwift

class ProductDetailVC: UIViewController {

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var amount: UILabel!
    @IBOutlet weak var addToCart: UIButton!
    @IBOutlet weak var stepper: UIStepper!

    var product: Product?
    var delegate: writeValueBackDelegate?

    private let realm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        initProduct()
    }


    private func initProduct() {
        productName.text = product!.name
        productImage.kf.setImage(with: URL(string: product?.photoUrl ?? ""))
        let productAmount = realm.object(ofType: Product.self, forPrimaryKey: product?.name ?? "")?.amount = 0
        stepper.value = Double(productAmount)
    }

    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        let amountString = String(getStepperCount())
        amount.text = amountString
        addToCart.setTitle("Add \(amountString) to cart", for: .normal)
    }

    @IBAction func addToCartClick(_ sender: Any) {
        delegate?.writeValueBack(amount: getStepperCount())
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }

    func getStepperCount() -> Int {
        return Int(stepper.value)
    }
}
