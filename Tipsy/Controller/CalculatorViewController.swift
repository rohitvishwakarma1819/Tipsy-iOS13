//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet var billTextField: UITextField!
    @IBOutlet var zeroPctButton: UIButton!
    @IBOutlet var tenPctButton: UIButton!
    @IBOutlet var twentyPctButton: UIButton!
    @IBOutlet var splitNumberLabel: UILabel!

    var bill: Bill = Bill(peopleCount: 2, billAmount: 0.0, tipPct: 0.0)

    @IBAction func tipChanged(_ sender: UIButton) {
        resetButtonsSelection()
        sender.isSelected = true
        bill.tipPct = getPctValue(button: sender)
        billTextField.endEditing(true)
    }

    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        bill.peopleCount = Int(sender.value)
        splitNumberLabel.text = String(bill.peopleCount)
    }

    @IBAction func calculatePressed(_ sender: Any) {
        let billAmount = Float(billTextField.text!) ?? 0.0
        let individualBillAmount = Float((billAmount + billAmount * bill.tipPct) / Float(bill.peopleCount))
        bill.billAmount = individualBillAmount
        performSegue(withIdentifier: "goToResult", sender: self)
    }

    func resetButtonsSelection() {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
    }

    func getPctValue(button: UIButton) -> Float {
        if button == zeroPctButton {
            return 0.0
        } else if button == tenPctButton {
            return 0.1
        } else {
            return 0.2
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bill = bill
        }
    }
}
