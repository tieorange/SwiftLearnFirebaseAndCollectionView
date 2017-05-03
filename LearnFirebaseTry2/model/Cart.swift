//
//  Cart.swift
//  LearnFirebaseTry2
//
//  Created by Andrii Kovalchuk on 02/05/2017.
//  Copyright © 2017 Andrii Kovalchuk. All rights reserved.
//

import Foundation
import EVReflection

class Cart: EVObject {
    public var productsFirebase = [Product]()

    convenience init(products: [Product]) {
        self.init()
        products.forEach {
            self.productsFirebase.append($0)
        }
    }
}
