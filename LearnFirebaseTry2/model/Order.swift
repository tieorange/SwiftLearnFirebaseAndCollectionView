//
//  Order.swift
//  LearnFirebaseTry2
//
//  Created by Andrii Kovalchuk on 02/05/2017.
//  Copyright © 2017 Andrii Kovalchuk. All rights reserved.
//

import Foundation
import RealmSwift

class Order: Object {

    dynamic var clientName: String = ""
    var cart: Cart?


    convenience public init(_ dictionary: [String: AnyObject]) {
        self.init()
        self.clientName = dictionary["clientName"] as? String ?? ""
//        self.
    }
}
