import UIKit

/*
 if 조건식{
 실행할 구문
 }
 */

let age = 20
if age < 19 {
print("미성년자 입니다.")
}


if age < 19 {
print("미성년자")
} else{ //if 조건식을 만족하지 못할때 else 실행
    ("성년자")
}


let animal = "cat"

if animal == "dog"{
    print("강아지 사료주기")
} else if animal == "cat"{
print("고양이 사료주기")
} else{
    print("해당하는 동물사료 없음")
}

/*
 switch 비교대상{
 case 패턴:1
 //패턴1 일치할때 실행되는 구문
 case 패턴2, 패턴3:
 //패턴 2, 3이 일치될때 사용되는 구문
 default:
 //어느 비교 패턴과도 일치하지 않을 떄 사용되는 구문
 }
 
 */

let color = "green"

switch color {
case "blue" :
    print("파란색 입니다.")
case "red" :
    print("빨간색 입니다.")
case "green" :
    print("초록색입니다.")

default :
    print("정의할 색이 없습니다.")
}


let temperature = 30
switch temperature{
case -20...9 :
    print("겨울입니다.")
case 10...25 :
    print("봄입니다.")
case 26...40 :
    print("여름입니다.")
default :
    print("이상기온입니다.")
}
