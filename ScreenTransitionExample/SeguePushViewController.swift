//
//  SeguePushViewController.swift
//  ScreenTransitionExample
//
//  Created by 강민우 on 2022/12/05.
//

import UIKit

class SeguePushViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func tapBackButton(_ sender: UIButton) {
    
    self.navigationController?.popViewController(animated: true)
    }
}
