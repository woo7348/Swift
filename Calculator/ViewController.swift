//
//  ViewController.swift
//  Calculator
//
//  Created by 강민우 on 2022/12/20.
//

import UIKit

enum Operation{
    case Add
    case Subtract
    case Divide
    case Multiply
    case unknown
}

class ViewController: UIViewController {

    @IBOutlet weak var numberOutPutLabel: UILabel!
    
    var displayNumber = "" //계산기 버튼을 누를때 마다 number OutputLabel에 표시되는 숫자를 가지고 있는 property
    var firstOperand = "" // 이전계산값을 저장하는 property
    var secondOperand = "" // 새롭게 입력된 값을 저장하는 property
    var result = "" // 게산의 결과값을 저장하는 property
    var currentOperation : Operation = .unknown // 현재의 계산기에 어떤 연산자가 입력되어있는지 알 수 있게 연산자의 값을 저장하는 property
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tapNumberButton(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else {return}
        if self.displayNumber.count < 9 {
            self.displayNumber += numberValue
            self.numberOutPutLabel.text = self.displayNumber
        }
    }
    
    @IBAction func tapClearButton(_ sender: UIButton) {
    }
    
    @IBAction func tapDotButton(_ sender: UIButton) {
    }
    
    @IBAction func tapDivideButton(_ sender: UIButton) {
    }
    
    @IBAction func tapMultiplyButton(_ sender: UIButton) {
    }
    
    @IBAction func tapSubtractButton(_ sender: UIButton) {
    }
    
    @IBAction func tapAddButton(_ sender: UIButton) {
    }
    
    @IBAction func tapEqualButton(_ sender: UIButton) {
    }
    
}

