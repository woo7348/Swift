//
//  SeguePresentViewController.swift
//  ScreenTransitionExample
//
//  Created by 강민우 on 2022/12/06.
//

import UIKit

class SeguePresentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func tapBackButton(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
