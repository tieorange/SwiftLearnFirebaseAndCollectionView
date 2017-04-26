//
// Created by Andrii Kovalchuk on 25/04/2017.
// Copyright (c) 2017 Andrii Kovalchuk. All rights reserved.
//

import Foundation

class Product: NSObject {
    var name: String!
    var price: Int!
    var photoUrl: String!
    var amount = 0

    override init() {
        super.init()
    }

    init(name: String, price: Int, photoUrl: String) {
        self.name = name
        self.price = price
        self.photoUrl = photoUrl

        super.init()
    }


}
