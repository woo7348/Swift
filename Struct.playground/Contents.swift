import UIKit

struct User {
    var nickname: String
    var age: Int
    
    func information(){
        print("\(nickname) \(age) ")
    }
}

var user = User(nickname: "minwoo", age: 23 )

user.nickname

user.nickname = "Ego"

user.nickname

user.information()

