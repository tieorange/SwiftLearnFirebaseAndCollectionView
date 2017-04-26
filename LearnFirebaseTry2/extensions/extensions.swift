//
// Created by Andrii Kovalchuk on 26/04/2017.
// Copyright (c) 2017 Andrii Kovalchuk. All rights reserved.
//

import Foundation

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
        return "\(self.toPriceDouble())0"
    }
}