//
//  CityCovidOverView.swift
//  Covid19
//
//  Created by 강민우 on 2023/02/13.
//

import Foundation

struct CityCovidOverview: Codable {
    let korea: CovidOverview
    let seoul: CovidOverview
    let busan: CovidOverview
    let daegu: CovidOverview
    let incheon: CovidOverview
    let gwangju: CovidOverview
    let ulsan: CovidOverview
    let sejong: CovidOverview
    let gangwon: CovidOverview
    let daejeon: CovidOverview
    let gyeonggi: CovidOverview
    let chungbuk: CovidOverview
    let chungnam: CovidOverview
    let jeonbuk: CovidOverview
    let jeonnam: CovidOverview
    let gyeongbuk: CovidOverview
    let gyeongnam: CovidOverview
    let jeju: CovidOverview
} //구조체 정의

struct CovidOverview: Codable {
    let countryName: String
    let newCase: String
    let totalCase: String
    let recovered: String
    let death: String
    let percentage: String
    let newCcase: String
    let newFcase: String
}
