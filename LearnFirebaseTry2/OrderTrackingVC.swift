//
//  OrderTrackingVC.swift
//  LearnFirebaseTry2
//
//  Created by Andrii Kovalchuk on 01/04/2017.
//  Copyright © 2017 Andrii Kovalchuk. All rights reserved.
//

import UIKit
import FirebaseDatabase

class OrderTrackingVC: UIViewController {

    private var ref: FIRDatabaseReference!
    private var ordersList = [Order]()

    override func viewDidLoad() {
        super.viewDidLoad()

        initFirebase()
    }

    private func initFirebase() {
        let database = FIRDatabase.database()
        ref = database.reference()

        ref?.child("orders").observe(.childAdded, with: { (snapshot) in
            let dictionary = snapshot.value as! [String: AnyObject]

            let order = Order(dictionary)
            self.ordersList.append(order)

            print(order)
        })
    }
}
