//
// Created by Andrii Kovalchuk on 25/04/2017.
// Copyright (c) 2017 Andrii Kovalchuk. All rights reserved.
//

import Foundation
import RealmSwift

class Product: Object, NSCopying {
    dynamic var name = ""
    dynamic var price = 0
    dynamic var photoUrl = ""
    dynamic var amount = 0

    convenience public init(name: String, price: Int, photoUrl: String) {
        self.init()
        self.name = name
        self.price = price
        self.photoUrl = photoUrl
    }

    override static func primaryKey() -> String? {
        return "name"
    }

    var moneyWithCents: Double {
        get {
            return Double(price) / 100.0
        }
        set(value) {
            price = Int(value * 100)
        }
    }

    var moneyWithCentsString: String {
        get {
            return "\(moneyWithCents)0 zł"
        }
    }

    var sumMoneyWithCentsString: String {
        get {
            if (amount <= 0) {
                return moneyWithCentsString
            }
            return "\(Double(amount) * moneyWithCents)0 zł"
        }
    }

    public func copy(with zone: NSZone?) -> Any {
        let copy = Product(name: name, price: price, photoUrl: photoUrl)
        copy.amount = amount
        return copy
    }

}
