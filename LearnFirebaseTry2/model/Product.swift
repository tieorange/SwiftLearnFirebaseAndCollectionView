//
// Created by Andrii Kovalchuk on 25/04/2017.
// Copyright (c) 2017 Andrii Kovalchuk. All rights reserved.
//

import Foundation

class Product: NSObject {
    var name: String!
    var price: Int!

    override init() {
        super.init()
    }

    init(name: String, price: Int) {
        self.name = name
        self.price = price
        super.init()
    }
}
