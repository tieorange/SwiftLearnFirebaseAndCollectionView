//
// Created by Andrii Kovalchuk on 26/04/2017.
// Copyright (c) 2017 Andrii Kovalchuk. All rights reserved.
//

import Foundation
import EVReflection

extension Double {
    /// Rounds the double to decimal places value
    func roundTo(places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

extension Int {
    /// Rounds the double to decimal places value
    func toPriceDouble() -> Double {
        let price = Double(self)
        return (price / 100.00).roundTo(places: 3)
    }

    // FIXME: show 0 with mathematics, not just string.
    func toPriceString() -> String {
        return "\(self.toPriceDouble())0 zł"
    }
}

extension NSObject {
    var theClassName: String {
        return NSStringFromClass(type(of: self))
    }
}

/*
extension List : EVReflectable {
    public func constructWith(value: Any?) {
        if let array = value as? [NSDictionary] {
            self.removeAll()
            for dict in array {
                if let element: T = EVReflection.fromDictionary(dict, anyobjectTypeString: _rlmArray.objectClassName) as? T {
                    self.append(element)
                }
            }
        }
    }
    public func toCodableValue() -> Any {
        return self.enumerated().map { ($0.element as? EVReflectable)?.toDictionary() ?? NSDictionary() }
    }
}*/
