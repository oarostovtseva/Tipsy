//
//  ViewController.swift
//  Tipsy
//
//  Created by Olena Rostovtseva on 27.04.2020.
//  Copyright © 2020 orost. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet var totalAmountLabel: UITextField!
    @IBOutlet var zeroTipsButton: UIButton!
    @IBOutlet var tenTipsButton: UIButton!
    @IBOutlet var twentyTipsButton: UIButton!
    @IBOutlet var splitLabel: UILabel!
    @IBOutlet var stepper: UIStepper!
    
    @IBAction func tipsChanged(_ sender: UIButton) {
        totalAmountLabel.endEditing(true)
        if sender.tag == 0 {
            zeroTipsButton.isSelected = true
            tenTipsButton.isSelected = false
            twentyTipsButton.isSelected = false
        } else if sender.tag == 10 {
            zeroTipsButton.isSelected = false
            tenTipsButton.isSelected = true
            twentyTipsButton.isSelected = false
        } else {
            zeroTipsButton.isSelected = false
            tenTipsButton.isSelected = false
            twentyTipsButton.isSelected = true
        }
    }
    
    @IBAction func splitChanged(_ sender: UIStepper) {
        splitLabel.text = String(format: "%.f", sender.value)
    }
    
    @IBAction func calculate(_ sender: UIButton) {
        if totalAmountLabel.text != nil {
            performSegue(withIdentifier: "gotoResultScreen", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gotoResultScreen" {
            let vc = segue.destination as! ResultViewController
            vc.total = calculateResultAmount()
            vc.numPeople = Int(stepper.value)
            vc.tips = getTipsPercent()
        }
    }
    
    fileprivate func calculateResultAmount() -> Double {
        let amount = Double(totalAmountLabel.text!)
        
        if let notEmptyAmount = amount {
            let tipsPercent = getTipsMultiplier()
            let numPeople = stepper.value
            return notEmptyAmount * tipsPercent / numPeople
        } else {
            return 0
        }
    }
    
    func getTipsPercent() -> Int {
        if zeroTipsButton.isSelected {
            return 0
        } else if tenTipsButton.isSelected {
            return 10
        } else {
            return 20
        }
    }
    
    func getTipsMultiplier() -> Double {
        return Double(1) + Double(getTipsPercent()) / 100
    }
}
