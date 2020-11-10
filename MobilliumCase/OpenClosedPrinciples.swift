import Foundation
import UIKit

protocol Scrappable {
  func getScrapingAddress() -> String
}

class Scrapper {
  
  func getScrapingAddress() {
    let vehicles: [Scrappable] = [
      Car(brand: "Ford"),
      Car(brand: "Pejo"),
      Car(brand: "Toyota")
    ]
    
    vehicles.forEach { vehicle in
      print(vehicle.getScrapingAddress())
    }
  }
}

class Car: Scrappable {
  
  let brand: String
  
  init(brand: String) {
    self.brand = brand
  }
  
  func getScrapingAddress() -> String {
    return ""
  }
}

class Truck: Scrappable {

  let brand: String
  
  init(brand: String) {
    self.brand = brand
  }
  
  func getScrapingAddress() -> String {
    return ""
  }
}


class UserService {
  func contact(user: String) {
    
  }
}

class ValidUserService: UserService {
  override func contact(user: String) {
    guard user.count > 17 else { return }
    super.contact(user: user)
  }
}


protocol MyProtocol {
  var readOnlyProperty: String { get }
}

struct MySturct: MyProtocol {
  var readOnlyProperty: String
}

struct OtherStruct: MyProtocol {
  var i = 0
  var readOnlyProperty: String { return "\(i)" }
}

struct MyThirdStruct: MyProtocol {
  
  var readOnlyProperty: String
  
  mutating func changeProperty() {
    readOnlyProperty = ""
  }
}

class ViewController: UIViewController {
  var myStruct = MySturct(readOnlyProperty: "myStruct")
  var otherStruct = OtherStruct()
  var myThirdStruct = MyThirdStruct(readOnlyProperty: "myThirdStruct")
  
  func changeStruct() {
    myStruct.readOnlyProperty = "hi"
//    otherStruct.readOnlyProperty = ""
    myThirdStruct.readOnlyProperty = "hey"
    
  }
}



protocol UserIdentity {
  var id: String { get }
  var nickname: String { get set }
  var photo: UIImage? { get set }
}

protocol User: UserIdentity {
  var name: String { get }
  var lastname: String { get }
  var lastLogin: Date { get set }
  var todos: [String] { get set }
}

struct ActiveUser: User {
  var name: String
  
  var lastname: String
  
  var lastLogin: Date
  
  var todos: [String]
  
  var id: String
  
  var nickname: String
  
  var photo: UIImage?

}
