//
// Created by Andrii Kovalchuk on 25/04/2017.
// Copyright (c) 2017 Andrii Kovalchuk. All rights reserved.
//

import Foundation

class Product: NSObject {
    private var _name: String!
    private var _price: Int!

    var name: String {
        return _name
    }

    var price: Int {
        return _price
    }

    override init() {
        super.init()
    }

    init(name: String, price: Int) {
        self._name = name
        self._price = price
        super.init()
    }
}
