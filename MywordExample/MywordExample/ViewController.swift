//
//  ViewController.swift
//  MywordExample
//
//  Created by 강민우 on 2022/11/29.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var colorView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func tapChangeColorButton(_ sender: UIButton) {
        self.colorView.backgroundColor = UIColor.systemGray3
        print("색상 변경 버튼 클릭 완료")
    }

}

