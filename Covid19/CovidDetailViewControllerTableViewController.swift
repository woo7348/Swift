//
//  CovidDetailViewControllerTableViewController.swift
//  Covid19
//
//  Created by 강민우 on 2023/02/13.
//

import UIKit

class CovidDetailViewControllerTableViewController: UITableViewController {
    
    @IBOutlet weak var newCaseCell: UITableViewCell!
    @IBOutlet weak var totalCaseCell: UITableViewCell!
    @IBOutlet weak var recoveredCell: UITableViewCell!
    @IBOutlet weak var deathCell: UITableViewCell!
    @IBOutlet weak var percentageCell: UITableViewCell!
    @IBOutlet weak var overseasinflowCell: UITableViewCell!
    @IBOutlet weak var regionalOutbreakCell: UITableViewCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
