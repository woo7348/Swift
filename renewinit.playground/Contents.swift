import Foundation

/*
 init (매개변수: 타입, ...){
    //프로퍼티 초기화
    // 인스턴스 생성시 필요한 설정을 해주는 코드 작성
 }
 */

class User {
    var nickname: String
    var age:  Int
    
    init(nickname:  String, age: Int) {
        self.nickname = nickname
        self.age = age
    }
    
    // 매개변수로 전달받지 않고, 생성자 안에서 프로퍼티의
    // 값을 대입하여 초기화도 가능하다. * user2 변수 참고
    
    init(age: Int){
        self.nickname = "baboo"
        self.age = age
    }
    deinit {
        print("deinit user")
}
}
var user = User(nickname: "Minwoo", age: 23)
user.nickname
user.age

var user2 = User(age: 27)
user2.nickname
user2.age

var user3: User? = User(age: 22)
user3 = nil
// deinit 구문안에 작성했던 deinit user가 출력된다.
// 스위프트는 인스턴스가 필요하지 않으면 자동으로 메모리에서 소멸시킨다
// user3에 nil을 입력하게되면 인스턴스가 더이상 필요하지 않다고 판단해 deinit이 호출되게 된다.
