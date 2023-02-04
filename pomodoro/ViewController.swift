//
//  ViewController.swift
//  pomodoro
//
//  Created by 강민우 on 2023/02/03.
//

import UIKit
import AudioToolbox // 시계 알림소리 시스템 사운드 호출을 위함

enum TimerStatus {
    case start
    case pause
    case end
} // 열거형으로 정의

class ViewController: UIViewController {
    
    @IBOutlet weak var timerLabel: UILabel! // 타이머
    @IBOutlet weak var datePicker: UIDatePicker! // 날짜
    @IBOutlet weak var cancelButton: UIButton! // 취소버튼
    @IBOutlet weak var progressView: UIProgressView! // 진행중을 알려주는 동적 바
    @IBOutlet weak var toggleButton: UIButton! // 시작버튼
    @IBOutlet weak var imageView: UIImageView!
    
    var duration = 60 // 타이머에 설정된 시간을 초단위로 저장하는 프로퍼티 60으로 초기화 시켜주는 이유는 앱이 실행되면 datePicker가 기본적으로 1분으로 설정되어있기 때문.
    var timerStatus: TimerStatus = .end
    //초기값이 end, 타이머의 상태를 가지고있는 프로퍼티. 타이머가 시작된 상태면 start 열거형 값을 가지고있고, 일시정지된 상태는 pause 열거형 값. 타이머가 종료된 상태면 end의 열거형 값을 가지게된다.
    var timer: DispatchSourceTimer?
    var currentSeconds = 0 // 현재 카운트다운 되고있는 시간을 초로 저장하는 프로퍼티.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureToggleButton()
    }
    
    func setTimerInfoViewVisible(isHidden: Bool) { //
        self.timerLabel.isHidden = isHidden
        self.progressView.isHidden = isHidden
    }
    
    func configureToggleButton(){ // 시작버튼 타이틀 변경 메소드
        self.toggleButton.setTitle("시작", for: .normal) // 평소에는 버튼이 "시작"
        self.toggleButton.setTitle("일시정지", for: .selected) // 버튼이 선택되면 "일시정지"로 버튼 타이틀 변경
    }
    
    func startTimer(){
        if self.timer == nil {
            self.timer = DispatchSource.makeTimerSource(flags: [], queue: .main) // main thread -> 메인 스레드는 인터페이스 스레드라고도 불리는데, 유저가 인터페이스에 접근하면 이벤트는 메인스레드에 전달되고, 우리가 작성한코드가 이에반응.
            // 인터페이스와 관련된 코드는 반드시 메인스레드에서 작성되어야 한다.
            self.timer?.schedule(deadline: .now(), repeating: 1) // 어떤 주기로 타이머를 실행할지 설정. deadline -> 타이머가 시작되면 언제 실행되는지 설정하는 파라미터.
            // repeating 파라미터 -> 몇초마다 반복되는지 설정.
            self.timer?.setEventHandler(handler: { [weak self] in
                guard let self = self else{ return }
                self.currentSeconds -= 1 // 1초에 한번씩 핸들러 클로저가 호출되면 currentSeconds를 1씩 감소하게한다. -> 카운트 다운.
                let hour = self.currentSeconds / 3600
                let minutes = (self.currentSeconds % 3600) / 60
                let seconds = (self.currentSeconds % 3600) % 60
                self.timerLabel.text = String(format: "%02d:%02d:%02d", hour, minutes, seconds) // 시간표시
                self.progressView.progress = Float(self.currentSeconds) / Float(self.duration) // 프로그래스가 줄어드는 과정 표시
                //debugPrint(self.progressView.progress) // 콘솔에 프로그래스가 줄어드는 비율을 표시
                UIView.animate(withDuration: 0.5, delay: 0, animations: {
                    self.imageView.transform = CGAffineTransform(rotationAngle: .pi)
                })
                UIView.animate(withDuration: 0.5, delay: 0.5, animations: {
                    self.imageView.transform = CGAffineTransform(rotationAngle: .pi * 2)
                })
                
                if self.currentSeconds <= 0 { // currentSeconds가 1보다 작다면 타이머 종료
                self.stopTimer()
                AudioServicesPlaySystemSound(1005) // iphonedev.wiki 에서 오디오 코드 확인가능
                }
            }) // closer 함수를 구현하는데, 타이머가 동작할때마다 이 핸들러 클로저 함수가 호출된다.
            self.timer?.resume() //타이머 시작
        }
    }
    
    func stopTimer(){
        if self.timerStatus == .pause {
            self.timer?.resume()
        }
        self.timerStatus = .end
        self.cancelButton.isEnabled = false // 취소버튼을 비활성화
        UIView.animate(withDuration: 0.5 , animations: {
            self.timerLabel.alpha = 0
            self.progressView.alpha = 0
            self.datePicker.alpha = 1
            self.imageView.transform = .identity // imageView가 원상태로 돌아오게한다.
        })
        self.toggleButton.isSelected = false // 토글버튼의 타이틀이 "시작"이 되게 만들어줌
        self.timer?.cancel()
        self.timer = nil // 메모리에서 해제. 해제시켜주지않으면 화면에서 벗어나도 타이머가 계속 동작할 수 있다.
    }
 
    @IBAction func tapCancelButton(_ sender: UIButton) { //취소버튼을 눌렀을때.
        switch self.timerStatus {
        case.start, .pause:
//            self.timerStatus = .end
//            self.cancelButton.isEnabled = false // 취소버튼을 비활성화
//            self.setTimerInfoViewVisible(isHidden: true) // 타이머를 표시하는 라벨과 progressView가 표시되지 않게한다.
//            self.datePicker.isHidden = false // datePicker를 다시 표시
//            self.toggleButton.isSelected = false // 토글버튼의 타이틀이 "시작"이 되게 만들어줌
            self.stopTimer()
            
        default:
            break
        }
    }
    
    @IBAction func tapToggleButton(_ sender: UIButton) {
        self.duration = Int(self.datePicker.countDownDuration)
        //countDownDuration : DatePicker에서 선택한 타이머 시간이 몇초인지 알려준다.
        // ex) 2분설정 -> 120초. , 60분 -> 3600초
        // debugPrint(self.duration) // self.duration을 콘솔로 출력
        switch self.timerStatus {
        case .end:
            self.currentSeconds = self.duration
            self.timerStatus = .start //case end일때 timerStatus값을 start로 변경시켜주고, 타이머가 시작되면, 시작버튼이 일시정지버튼으로 변경되고, 일시정지되면
            // 타이머가 시작되면 시작버튼을 일시정지 버튼으로 바뀌기 때문에 timerStatus 값을 pause로 변경해줘야 하기때문에 case start = timerStatus 값을 pause로 변경 시켜줘야한다.
            UIView.animate(withDuration: 0.5 , animations: {
                self.timerLabel.alpha = 1 // 타이머라벨 알파값 설정
                self.progressView.alpha = 1 // 프로그레스뷰 알파값 설정
                self.datePicker.alpha = 0 // 데이트피커 값을 0으로 만들어서 데이트피커가 사라지게 설정.
            })
            self.toggleButton.isSelected = true // 버튼의 타이틀이 일시정지로 변경
            self.cancelButton.isEnabled = true // 취소버튼 활성화
            self.startTimer()
            
        case .start:
            self.timerStatus = .pause
            self.toggleButton.isSelected = false // 일시정지버튼을 눌렀을때 다시 시작버튼으로 변경되게 구현
            self.timer?.suspend() // 타이머를 일시정지.
        case .pause:
            self.timerStatus = .start
            self.toggleButton.isSelected = true // 일시정지 후에 다시 시작버튼을 눌렀을때, 타이머를 다시 시작상태로 변경.
            self.timer?.resume() // 타이머를 시작.
        }
    }
    
}

