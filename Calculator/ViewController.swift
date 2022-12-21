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
    
    @IBOutlet weak var numberOutputLabel: UILabel!
    
    var displayNumber = "" //계산기 버튼을 누를때 마다 number OutputLabel에 표시되는 숫자를 가지고 있는 property
    var firstOperand = "" // 이전계산값을 저장하는 property
    var secondOperand = "" // 새롭게 입력된 값을 저장하는 property
    var result = "" // 게산의 결과값을 저장하는 property
    var currentOperation: Operation = .unknown // 현재의 계산기에 어떤 연산자가 입력되어있는지 알 수 있게 연산자의 값을 저장하는 property
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapNumberButton(_ sender: UIButton) {
        guard let numberValue = sender.titleLabel?.text else { return }
        if self.displayNumber.count < 9 {
        self.displayNumber += numberValue
        self.numberOutputLabel.text = self.displayNumber
        }
    }
    
    @IBAction func tapClearButton(_ sender: UIButton) {
        self.displayNumber = ""
        self.firstOperand = ""
        self.secondOperand = ""
        self.result = ""
        self.currentOperation = .unknown
        self.numberOutputLabel.text = "0"
    }
    
    @IBAction func tapDotButton(_ sender: UIButton) {
        if self.displayNumber.count < 8, !self.displayNumber.contains("."){
        self.displayNumber += self.displayNumber.isEmpty ? "0." : "."
        self.numberOutputLabel.text = self.displayNumber
        }
    }
    
    @IBAction func tapDivideButton(_ sender: UIButton) {
        self.operation(.Divide)
    }
    
    @IBAction func tapMultiplyButton(_ sender: UIButton) {
        self.operation(.Multiply)
    }
    
    @IBAction func tapSubtractButton(_ sender: UIButton) {
        self.operation(.Subtract)
    }
    
    @IBAction func tapAddButton(_ sender: UIButton) {
        self.operation(.Add)
    }
    
    @IBAction func tapEqualButton(_ sender: UIButton) {
        self.operation(self.currentOperation)
    }
    
    func operation(_ operation: Operation) {
        if self.currentOperation != .unknown {
            if !self.displayNumber.isEmpty {
                self.secondOperand = self.displayNumber
                self.displayNumber = ""
                
                guard let firstOperand = Double(self.firstOperand) else { return }
                guard let secondOperand = Double(self.secondOperand) else { return}
                
                switch self.currentOperation {
                case .Add:
                    self.result = "\(firstOperand + secondOperand)"
                    
                case .Subtract:
                    self.result = "\(firstOperand - secondOperand)"
                case .Divide:
                    self.result = "\(firstOperand / secondOperand)"
                case .Multiply:
                    self.result = "\(firstOperand * secondOperand)"
                
                default:
                    break
                }
                self.firstOperand = self.result
                self.numberOutputLabel.text = self.result
            }
            
            self.currentOperation = operation
        } else {
          self.firstOperand = self.displayNumber
          self.currentOperation = operation
          self.displayNumber = ""
        }
        
    }
}

