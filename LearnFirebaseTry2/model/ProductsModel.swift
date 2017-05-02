//
// Created by Andrii Kovalchuk on 29/04/2017.
// Copyright (c) 2017 Andrii Kovalchuk. All rights reserved.
//

import Foundation
import RealmSwift

class ProductsModel {

    class func getAmountByPrimaryKey(primaryKey: String, realm: Realm) -> Int {
        return realm.object(ofType: Product.self, forPrimaryKey: primaryKey)?.amount ?? 0
    }

    class func getAllProductsInCart(realm: Realm) -> [Product] {
        return Array(realm.objects(Product.self).filter("amount > 0"))
    }

    class func removeProductsWithZeroAmount(realm: Realm) {
        try! realm.write {
            realm.delete(realm.objects(Product.self).filter("amount <= 0"))
        }
    }
}
