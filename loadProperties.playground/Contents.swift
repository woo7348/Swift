import Foundation
import Darwin

struct Dog {
    var name: String
    let gender: String
}
// 위와같이 구조체 내에 선언된 변수나 상수를 저장 프로퍼티라고한다.

var dog = Dog(name: "Kao", gender: "male")
print(dog)

dog.name = "카오"
// dog.gender = "female"
// 위 gender 는 let으로 상수로 선언되어있기 때문에 값을 변경할 수 없어 오류가 나온다
// 오류 수정을 위해서는 let 을 var 로 수정해야함.

let dog2 = Dog(name: "Minwoo", gender: "male")
// dog2.name = "강민우". ***오류. name이라는 프로퍼티가 변수로 선언 되어있어도
// dog2가 상수로 선언되어있기 떄문에 변경할 수 없다.
// 구조체 프로퍼티를 let(상수)로 선언하게 되면 내부 프로퍼티들도 상수가 되어서 수정할 수 없다.

class Cat {
    var name: String
    let gender: String
    
    init(name: String, gender: String) {
        self.name = name
        self.gender = gender
    }
}

let cat = Cat(name: "json", gender: "male")
cat.name = "MG"
print(cat.name)

// 클래스는 **참조타입 이어서 구조체와 다른결과가 나온다.
// 클래스 인스턴스는 상수로 선언이 되어도 변수로 선언한 프로퍼티의 값을 바꿀 수 있다.

struct Stock{
    var averagePrice: Int
    var quantity : Int
    var purchasePrice: Int{
        get {
            return averagePrice * quantity
        }
        
        set(newPrice){
            averagePrice = newPrice / quantity
        }
    } //get & set 을 이용하여 값을 연산하여 프로퍼티에 전달하는것이 연산형 프로퍼티이다.
}

var stock = Stock(averagePrice: 2300, quantity: 3)
print(stock)
stock.purchasePrice
// purchasePrice에 접근하게되면 get 안에있는 코드블럭이 실행이 되고, 평균단가와 총 수량이
// 입력이 되기 때문에 6900이라는 결과 값을 얻게 된다.

stock.purchasePrice = 3000
stock.averagePrice
// purchasePrice값을 3000으로 변경해주면 set 구문이 실행이 되면서
// 3000을 3의 수량으로 나누게 되어 평균가격이 1000으로 나온다.


class Account {
    var credit: Int = 0{
        //소괄호 이름 지정
        willSet {
            print("잔액이 \(credit)원에서 \(newValue)원으로 변경될 예정입니다")
        }
        
        didSet {
            print("잔액이 \(oldValue)원에서 \(credit)원으로 변경되었습니다.")
        }
    }
}

var account = Account()
account.credit = 1000


// 타입 프로퍼티
// 타입 프로퍼티는 연산프로퍼티와 저장 프로퍼티 내에서만 사용가능하다.
struct SomeStructure {
    static var storedTypeProperty = "Some value."
    // 스토어
    static var computedTypeProperty: Int {
    // 컴퓨티드
        return 1
    }
}

SomeStructure.computedTypeProperty
SomeStructure.storedTypeProperty
SomeStructure.storedTypeProperty = "hello"
SomeStructure.storedTypeProperty
