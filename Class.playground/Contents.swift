import UIKit

class Dog{
    var name: String = ""
    var age : Int = 0
    
    init(){
    }
    
    
    func introduce(){
        print("name \(name) age \(age)")
    }
}

var dog = Dog()
dog.name = "Kao"
dog.age = 3

dog.name
dog.age

dog.introduce()
