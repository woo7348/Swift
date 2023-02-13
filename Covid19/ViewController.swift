//
//  ViewController.swift
//  Covid19
//
//  Created by 강민우 on 2023/02/13.
//

import Charts
import UIKit

class ViewController: UIViewController {
 
    @IBOutlet weak var totalCaseLabel: UILabel!
    @IBOutlet weak var newCaseLabel: UILabel!
    @IBOutlet weak var pieChartView: PieChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

