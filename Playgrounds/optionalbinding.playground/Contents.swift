import UIKit

var number: Int? = 3
print(number)
print(number!)

//옵셔널값 뒤에 !를 붙여서 옵셔널을 강제 해제 가능하다.
//그러나 옵셔널 값이 nil 일때. 옵셔널을 강제해제 하게되면 프로그램이 강제로 종료될 수 있다.

if let result = number{
    print(result)
}else {

}

// if문으로 옵셔널바인딩을 하게되면 옵셔널이 추출된 변수나 상수를 if below 내에서만 사용할수 있다.
// guard문으로 옵셔널을 추출할 경우. guard문 다음 함수 전체 구문에서 추출된 변수나 상수를 사용 가능하다.
// guard문은 조건이 true일때만 guard문을 통과하고, false or else 구문을수행한뒤 흐름을 종료시키는 구문.
func test() {
    let number : Int? = 6
    guard let result = number else{return}
    print(result)
}

test()


let value: Int? = 6
if value == 6 {
    print("value 값은 6입니다.")
}else{
    print("value가 6이 아닙니다.")
}

// value는 6이라고 출력된다. 옵셔널값은 비교연산자를 이용해 다른값과 비교하면 컴파일러가 옵셔널값을 해제시켜줘서
// if 절이 실행되게 된다.

let string = "12"
var stringToInt : Int! = Int(string)
print (stringToInt + 1)

// 문자열로된 숫자를 Int형으로 변환하려면 변환하려는 문자열을 넣어주면된다.
// 만약 변환하려는 숫자가 숫자가 아닐때, nil이 반환되기 때문에 optional 타입으로 선언해 주어야 한다.
// 위의 stringToInt + 1 이 13으로 나온 이유는 묵시적 변환에 의해서 Int형으로 변환 되었기 때문이다.
