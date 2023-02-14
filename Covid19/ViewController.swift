//
//  ViewController.swift
//  Covid19
//
//  Created by 강민우 on 2023/02/13.
//
import UIKit
import Alamofire
import Charts

class ViewController: UIViewController {
 
    @IBOutlet weak var totalCaseLabel: UILabel!
    @IBOutlet weak var newCaseLabel: UILabel!
    @IBOutlet weak var pieChartView: PieChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchCovidOverview(completionHandler: {[weak self] result in
            guard let self = self else {return}
            switch result{
            case let.success(result):
                debugPrint("success \(result)")
                
            case let .failure(error):
                debugPrint("error \(error)")
            }
        })
    }
    
    func fetchCovidOverview( //api를 요청하고 서버에서 json데이터를 응답 받거나 요청에 실패했을때, completionHandler (클로저)를 호출해 해당클로저를 정의하는 곳에 응답받은 데이터를 전달하고자 한다.
        completionHandler: @escaping(Swift.Result<CityCovidOverview, Error>) -> Void
    ){ // 요청이 성공하면 CityCovidOverview 열거형 연관값을 전달 받을수 있고, 두번째 generic 에는 요청에 실패하거나 에러사항이면 에러 객체가 열거형 연관값으로 전달되게 작성.
        let url = "https://api.corona-19.kr/korea/country/new/"
        let param = [
            "serviceKey": "JSewAgaUYXPOfruKoxGbB8zCpiDlcZQ94"
        ]
        
        Alamofire.request(url, method: .get, parameters: param)
            .responseData(completionHandler: {response in
                switch response.result {
                case let .success(data):
                    do {
                    let decoder = JSONDecoder()
                        let result = try decoder.decode(CityCovidOverview.self, from: data)
                        completionHandler(.success(result))
                    }catch {
                        completionHandler(.failure(error))
                    }
                    
                case let .failure(error):
                    completionHandler(.failure(error))
                }
            })
    }
}

