//
//  Order.swift
//  LearnFirebaseTry2
//
//  Created by Andrii Kovalchuk on 02/05/2017.
//  Copyright © 2017 Andrii Kovalchuk. All rights reserved.
//

import Foundation
import EVReflection

import RealmSwift

class Order: EVObject {

    dynamic var clientName: String = ""
    dynamic var sumOfTimeToWait: Int = 0
    dynamic var status: String = ""
    var productsCart: Cart = Cart()


    class let STATE_ORDERED = "39"
    class let STATE_ACCEPTED = "38"
    class let STATE_READY = "29"
    class let STATE_REJECTED = "20"

    class let START_WITH_ORDERED_ORDERS = STATE_ORDERED.substring(0, 1)
    class let ORDERED_ORDERS_ENDS_WITH = START_WITH_ORDERED_ORDERS + "\\uf8ff"
    class let FINISHED_ORDERS_START_WITH = STATE_READY.substring(0, 1)
    class let FINISHED_ORDERS_END_WITH = FINISHED_ORDERS_START_WITH + "\\uf8ff"

}
