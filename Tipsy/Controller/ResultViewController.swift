//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Rohit Vishwakarma on 16/03/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var settingsLabel: UILabel!
    var bill:Bill?
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = String(bill?.billAmount ?? 0.0)
        settingsLabel.text = "Split between \(bill?.peopleCount ?? 2) peoples, with \((bill?.tipPct ?? 0.0)*100) tip."
        // Do any additional setup after loading the view.
    }

    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
     }
     */
}
