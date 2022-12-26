//
//  ViewController.swift
//  whattodo
//
//  Created by 강민우 on 2022/12/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var tasks = [Task]() //Task 타입의 배열을 초기화
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
    }

    @IBAction func tapEditButton(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func tapAddButton(_ sender: UIBarButtonItem) {
        let alert =  UIAlertController(title: "할일 등록", message: nil, preferredStyle: .alert)
        let registeButton = UIAlertAction(title: "등록", style: .default, handler: { [weak self]_ in
            guard let title = alert.textFields?[0].text else { return }
            let task = Task(title: title, done: false) //테스크 구조체를 인스턴스.
            //done: false : 할일이 아직 안끝났으니 false 처리해서 생성자 전달.
            self?.tasks.append(task)
            //guard 로 옵셔널 바인딩
            // else 옵셔널이면 return 된다.
            // 텍스트필드 생성구문. 입력후 등록을 누르면, 콘솔창에 텍스트가 나온다.(한글은 아직)
            //closer 선언부에서 캡쳐목록을 정의해주는 이유는 클래스처럼 클로저는 참조타입이기 때문에 클로저의 본문에서 self 로 class instance 를 캡쳐할때, 강한 순환참조가 발생할 수 있다.
            //강한 순환참조 : 두개의 객체가 상호참조하는경우 강한 순환참조가 만들어지기 떄문에, 이렇게 되면 이 순환참조에 연관된 객체들은 레퍼런스 카운트가 0에 도달하지 않게되고 결국 메모리 누수로 이어질 수 있다.
            // 해결방법 : 클로저의 선언부에서 캡쳐 목록을 정의하는것으로 해결가능. ex) 클로저 선언부 대괄호 안에 [weak self] 를 작성하였는데, 이것이 캡쳐목록을 정의하는 것이다.
            //요약 : 클로저의 선언부에 weak 나 unkowned 키워드로 캡쳐목록을 정의하지않고 클로저 본문에서 셀프키워드로 클래스의 인스턴스의 프로퍼티로 접근하게되면 강한 순환참조가 발생해 메모리누수가 발생할 수 있다.
            self?.tableView.reloadData() // tasks배열에 할일들이 추가될때마다 tableview를 갱신해서 tableview에 추가될 할일들이 표시됨.
        })
        
        let cancelButton = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alert.addAction(cancelButton)
        alert.addAction(registeButton)
        alert.addTextField(configurationHandler: { textfield in textfield.placeholder = "할 일을 입력해 주세요"})
        self.present(alert, animated: true, completion: nil)
    }
    
}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tasks.count // 테이블뷰의 tasks 배열 의 갯수만큼 row가 있다고 선언.아래와 연계.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell" , for: indexPath)
        let task = self.tasks[indexPath.row] // task 상수 선언후 힐일들이 저장되어있는 배열에 indexpath.row 값으로 배열에 저장되어있는 할일 요소들을 가져온다. indexpath 에서 session이 0이고, row 가 0이면 가장 위에 보이는 셀의 위치를 의미한다.
        cell.textLabel?.text = task.title // task에 저장되어 있는 title이 cell에 textLabel에 표시된다는 뜻.
        return cell // return 값으로 cell 반환.
    }
    // dequeReusableCell : 지정된 재사용 식별자에대한 재사용가능한 테이블 뷰 cell 객체를 반환을 하고 이를 테이블 뷰에 추가하는 역할을 하는 메소드
    // 여기서 지정된 재사용된 식별자는 withidentifier 를 뜻한다. withidentifier값을 가지고 재사용할 cell을 찾는다. 그리고 for 파라미터에는 indexpath를 넘겨주는데, 그 이유는 indexpath 위치에 해당 셀을 재사용하기 위함이다.
    // 셀을 재사용하는 이유 : 여러개의 셀을 각각 만들어서 각각 메모리를 할당하게되면 불필요한 메모리의 낭비가 심해지게된다.
    // How? : 현재볼수있는 화면에 n개의 셀을 볼수 있다면, 앱은 n개의 셀에대한 데이터만 메모리로드하게 되고, 스크롤을 내리게되면, n개의 셀을 재사용하게 되어 메모리에 로드하게된다. 스크롤을 내리면서 새로운 샐이 보이면, 기존의 셀 데이터는 reusable pool라는 곳에  큐가되어 들어가게되고, 나중에 해당 데이터를 다시 보게되면 deque로 p ool에서 나오게된다.
}
