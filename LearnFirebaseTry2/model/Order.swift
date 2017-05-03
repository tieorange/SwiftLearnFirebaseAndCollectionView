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

class Order: EVObject{

    dynamic var clientName: String = ""
    var productsCart: Cart = Cart()

    /*convenience public init(_ dictionary: [String: AnyObject]) {
        self.init()
        self.clientName = dictionary["clientName"] as? String ?? ""

//        (dictionary["productsCart"] as! [String: AnyObject])["productsFirebase"]
        self.productsCart = dictionary["productsCart"] as? Cart ?? Cart()
    }*/
}
