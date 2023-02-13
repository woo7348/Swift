import UIKit


/*
 func 함수명( 파라미터 이름: 데이터 타입) -> 반환 타입{
 return 반환 값
 }
 */

func sum(a: Int, b: Int) -> Int {
    return a+b
}

sum(a: 5, b: 3)


func hello() -> String {
 return "Hello"
}

hello()

func printName() {
    //반환값이 없는 함수. 반환값을 적어주지 않아도 되고, 반환값에 Void 를 선언해주면 된다.
}

func greeting(friend: String, me: String = "gunter") {
print("Hello, \(friend)! I'm \(me)")
}

greeting(friend: "MinWoo")

/*
 func 함수이름(전달인자 레이블: 매개변수 이름: 매개변수 타입, 전달인자 레이블:
    매개변수 이름: 매개변수 타입...)-> 반환 타입{
 return 반환 갑
 }
 */
    
      
      
func sendMessage(from myName: String, to name: String) ->
String {
return "Hello \(name)! I'm \(myName)"
}

sendMessage(from: "Min Woo", to: "King")

func sendMessage(me: String, friends: String...)
->String{
    return("Hello, \(me), here is my \(friends)")
}

 sendMessage(me: "Min Woo", friends: "King", "Soto", "Bell")
