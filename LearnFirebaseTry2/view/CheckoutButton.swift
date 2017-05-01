//
//  CheckoutButton.swift
//  LearnFirebaseTry2
//
//  Created by Andrii Kovalchuk on 01/05/2017.
//  Copyright © 2017 Andrii Kovalchuk. All rights reserved.
//

import UIKit

class CheckoutButton: UIView {

    @IBOutlet weak var price: UILabel!
    @IBOutlet var view: UIView!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        Bundle.main.loadNibNamed("CheckoutButtonView", owner: self, options: nil)
        self.addSubview(self.view)
        initViews()
    }


    private func initViews() {

    }
}
