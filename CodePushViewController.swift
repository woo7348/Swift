//
//  CodePushViewController.swift
//  ScreenTransitionExample
//
//  Created by 강민우 on 2022/12/06.
//

import UIKit

class CodePushViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func tapBackButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
