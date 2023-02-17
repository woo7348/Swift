//
//  CovidDetailViewControllerTableViewController.swift
//  Covid19
//
//  Created by 강민우 on 2023/02/13.
//

import UIKit

class CovidDetailViewController: UITableViewController {
    
    @IBOutlet weak var newCaseCell: UITableViewCell!
    @IBOutlet weak var totalCaseCell: UITableViewCell!
    @IBOutlet weak var recoveredCell: UITableViewCell!
    @IBOutlet weak var deathCell: UITableViewCell!
    @IBOutlet weak var percentageCell: UITableViewCell!
    @IBOutlet weak var overseasinflowCell: UITableViewCell!
    @IBOutlet weak var regionalOutbreakCell: UITableViewCell!
    
    var covidOverview: CovidOverview? // 선택된 지역의 코로나 발생 데이터를 전달 받는다. ?는 옵셔널타입설정
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    }
    func configureView() {
        guard let covidOverview = self.covidOverview else { return }
        self.title = covidOverview.countryName
        self.newCaseCell.detailTextLabel?.text = "\(covidOverview.newCase)명"
        self.totalCaseCell.detailTextLabel?.text = "\(covidOverview.totalCase)명"
        self.recoveredCell.detailTextLabel?.text = "\(covidOverview.recovered)명"
        self.deathCell.detailTextLabel?.text = "\(covidOverview.death)명"
        self.percentageCell.detailTextLabel?.text = "\(covidOverview.percentage)%"
        self.overseasinflowCell.detailTextLabel?.text = "\(covidOverview.newFcase)명"
        self.regionalOutbreakCell.detailTextLabel?.text = "\(covidOverview.newCcase)명"
    }
}
