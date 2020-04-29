//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Olena Rostovtseva on 28.04.2020.
//  Copyright © 2020 orost. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var settingsLabel: UILabel!

    var total = 0.0
    var numPeople = 0
    var tips = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = String(format: "%.2f", total)
        settingsLabel.text = "Split between \(numPeople) people with \(tips)% tips"
    }

    @IBAction func recalculate(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
