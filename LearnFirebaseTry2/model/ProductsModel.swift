//
// Created by Andrii Kovalchuk on 29/04/2017.
// Copyright (c) 2017 Andrii Kovalchuk. All rights reserved.
//

import Foundation
import RealmSwift

class ProductsModel {

    class func getAmountByPrimaryKey(product: Product, realm: Realm) -> Int {
        if (product.isInvalidated) {
            return -1
        }

        return realm.object(ofType: Product.self, forPrimaryKey: product.name)?.amount ?? 0
    }
}
