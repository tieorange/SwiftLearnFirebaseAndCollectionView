//
// Created by Andrii Kovalchuk on 07/05/2017.
// Copyright (c) 2017 Andrii Kovalchuk. All rights reserved.
//

import Foundation
import FirebaseDatabase
import EVReflection


class OrderTools {

    public class func makeOrder(_ productsList: [Product]) {
        let ref = FIRDatabase.database().reference().child(ConstantValues.FIR_ORDERS)
        let order = Order()

        order.status = Order.STATE_ORDERED
        order.productsCart = Cart(productsList)
        order.clientName = UserTools.CLIENT_NAME
        productsList.forEach {
            order.sumOfTimeToWait += $0.cookingTime
        }

        ref.childByAutoId().setValue(order.toDict())
    }

}