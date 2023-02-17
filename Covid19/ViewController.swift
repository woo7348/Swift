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
            guard let self = self else { return }
            switch result{
            case let .success(result):
                self.configureStackView(koreaCovidOverview: result.korea) //라벨에 국내총 확진자수, 신규확진자수 표시
                let covidOverviewList = self.makeCovidOverviewList(cityCovidOverview: result)
                self.configureChartView(covidOverviewList: covidOverviewList) // 파이차트뷰에
                
                
            case let .failure(error):
                debugPrint("error \(error)")
            }
        })
    }
    func makeCovidOverviewList(
        cityCovidOverview: CityCovidOverview
    ) -> [CovidOverview] {
        return[
            cityCovidOverview.seoul,
            cityCovidOverview.busan,
            cityCovidOverview.daegu,
            cityCovidOverview.incheon,
            cityCovidOverview.gwangju,
            cityCovidOverview.daejeon,
            cityCovidOverview.ulsan,
            cityCovidOverview.sejong,
            cityCovidOverview.gyeonggi,
            cityCovidOverview.chungbuk,
            cityCovidOverview.chungnam,
            cityCovidOverview.gyeongbuk,
            cityCovidOverview.gyeongnam,
            cityCovidOverview.jeju,
            cityCovidOverview.jeonnam,
            cityCovidOverview.jeonbuk,
            cityCovidOverview.gangwon,
        ]
    }
    
    func configureChartView(covidOverviewList: [CovidOverview]){
        self.pieChartView.delegate = self
        let entries = covidOverviewList.compactMap { [weak self] overview -> PieChartDataEntry? in
            guard let self = self else { return nil }
            return PieChartDataEntry(
                value: self.removeFormatString(string: overview.newCase),
                label: overview.countryName,
                data: overview
            )
        }
                    let dataSet = PieChartDataSet(entries: entries, label: "코로나 발생 현황")
                    dataSet.sliceSpace = 1
                    dataSet.entryLabelColor = .black
                    dataSet.xValuePosition = .outsideSlice
                    dataSet.valueLinePart1OffsetPercentage = 0.8
                    dataSet.valueLinePart1Length = 0.2
                    dataSet.valueLinePart2Length = 0.3
        
                    dataSet.colors = ChartColorTemplates.vordiplom() +
                    ChartColorTemplates.joyful() +
                    ChartColorTemplates.liberty() +
                    ChartColorTemplates.pastel() +
                    ChartColorTemplates.material()
                    self.pieChartView.data = PieChartData(dataSet:dataSet)
                    self.pieChartView.spin(duration: 0.3, fromAngle: self.pieChartView.rotationAngle, toAngle: self.pieChartView.rotationAngle + 80)
    }
    func removeFormatString(string: String) -> Double {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter.number(from: string)?.doubleValue ?? 0
    }
    
    
    func configureStackView(koreaCovidOverview: CovidOverview){
        self.totalCaseLabel.text = "\(koreaCovidOverview.totalCase)명"
        self.newCaseLabel.text = "\(koreaCovidOverview.newCase)명"
    }
    
    func fetchCovidOverview( //api를 요청하고 서버에서 json데이터를 응답 받거나 요청에 실패했을때, completionHandler (클로저)를 호출해 해당클로저를 정의하는 곳에 응답받은 데이터를 전달하고자 한다.
        completionHandler: @escaping(Result<CityCovidOverview, Error>) -> Void
    ){ // 요청이 성공하면 CityCovidOverview 열거형 연관값을 전달 받을수 있고, 두번째 generic 에는 요청에 실패하거나 에러사항이면 에러 객체가 열거형 연관값으로 전달되게 작성.
        let url = "https://api.corona-19.kr/korea/country/new/"
        let param = [
            "serviceKey": "####################"
        ]
        
        AF.request(url, method: .get, parameters: param)
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

extension ViewController: ChartViewDelegate {
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        guard let covidDetailViewController = self.storyboard?.instantiateViewController(identifier: "CovidDetailViewController") as? CovidDetailViewController else { return }
        guard let covidOverview = entry.data as? CovidOverview else { return }
        covidDetailViewController.covidOverview = covidOverview
        self.navigationController?.pushViewController(covidDetailViewController, animated: true)
    }
}
