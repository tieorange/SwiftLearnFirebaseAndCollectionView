//
//  OrderTrackingVC.swift
//  LearnFirebaseTry2
//
//  Created by Andrii Kovalchuk on 01/04/2017.
//  Copyright © 2017 Andrii Kovalchuk. All rights reserved.
//

import UIKit
import FirebaseDatabase
import EVReflection

class OrderTrackingVC: UIViewController {

    private var ref: FIRDatabaseReference!
    private var ordersList = [Order]()

    @IBOutlet weak var sumTimeLabel: UILabel!
    @IBOutlet weak var otherTimeLabel: UILabel!
    @IBOutlet weak var yourOrderTimeLabel: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()

        initFirebase()

    }

    private func initFirebase() {
        ref = FIRDatabase.database().reference().child(ConstantValues.FIR_ORDERS)

//        ref?.child(ConstantValues.FIR_ORDERS).observe(.childAdded, with: { (snapshot) in
//            let dictionary = snapshot.value as! [String: AnyObject]
//
//            let order = EVReflection.fromDictionary(dictionary as! NSDictionary,
//                    anyobjectTypeString: String(describing: Order.self)) as! Order
//
//            self.ordersList.append(order)
//
//            print(order)
//        })

        ref.observe(.childAdded, with: { (snapshot) in
            let dictionary = snapshot.value as! NSDictionary

            let order = EVReflection
                    .fromDictionary(dictionary,
                    anyobjectTypeString: String(describing: Order.self)) as! Order

            self.addNewOrder(order: order)

            print(order)
        })

    }

    func addNewOrder(order: Order) {
        if (order.status.hasPrefix(Order.START_WITH_ORDERED_ORDERS)) {
            self.ordersList.append(order)

            if (order.clientName == UserTools.CLIENT_NAME) {
                yourOrderTimeLabel.text = "\(order.sumOfTimeToWait)"
            } else {

            }

        }

    }

    private func makeOrder() {
        let order = Order()
        order.clientName = "iPhone"
        order.productsCart = Cart()
        order.productsCart.productsFirebase.append(Product(name: "banan", price: 400, photoUrl: "https://www.organicfacts.net/wp-content/uploads/2013/05/Banana3.jpg"))
        ref?.child(ConstantValues.FIR_ORDERS).childByAutoId().setValue(order.toDictionary())
    }
}
