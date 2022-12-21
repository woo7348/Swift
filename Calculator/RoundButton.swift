//
//  RoundButton.swift
//  Calculator
//
//  Created by 강민우 on 2022/12/21.
//

import UIKit

@IBDesignable //변경된 설정값을 storyboard 상에서 실시간으로 확인할 수 있게 해주는 annotaion이다 
class RoundButton: UIButton {
    @IBInspectable var isRound: Bool = false { // IBInspectable 은 storyboard 에서도 isRound property 의 설정값을 수정할 수 있게 해준다.
        didSet {
            if isRound{
                self.layer.cornerRadius = self.frame.height / 2
            }
        }
    }
}
