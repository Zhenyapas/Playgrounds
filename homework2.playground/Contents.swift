import Foundation

// MARK: - Протокол Observer
protocol Observer: AnyObject {
    func didUpdatePrice(_ newPrice: Double)
}

// MARK: - Клас Stock (Об'єкт, що відсилає оновлення)
class Stock {
    private var observers = [Observer]()
    private(set) var price: Double {
        didSet {
            notifyObservers()
        }
    }
    
    init(price: Double) {
        self.price = price
    }
    
    // Додаємо спостерігача
    func addObserver(_ observer: Observer) {
        observers.append(observer)
    }
    
    // Видаляємо спостерігача
    func removeObserver(_ observer: Observer) {
        observers.removeAll { $0 === observer }
    }
    
    // Оновлення ціни
    func updatePrice(to newPrice: Double) {
        price = newPrice
    }
    
    // Сповіщаємо всіх спостерігачів про зміну ціни
    private func notifyObservers() {
        for observer in observers {
            observer.didUpdatePrice(price)
        }
    }
}

// MARK: - Клас User (Спостерігач)
class User: Observer {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    func didUpdatePrice(_ newPrice: Double) {
        print("\(name) отримав сповіщення: Нова ціна акції - \(newPrice)")
    }
}

// Приклад використання
let appleStock = Stock(price: 150.0)

let user1 = User(name: "Євген")
let user2 = User(name: "Ірина")

// Підписуємо користувачів на оновлення ціни
appleStock.addObserver(user1)
appleStock.addObserver(user2)

// Зміна ціни
appleStock.updatePrice(to: 155.0)
appleStock.updatePrice(to: 160.0)

// Вивід:
// Євген отримав сповіщення: Нова ціна акції - 155.0
// Ірина отримала сповіщення: Нова ціна акції - 155.0
// Євген отримав сповіщення: Нова ціна акції - 160.0
// Ірина отримала сповіщення: Нова ціна акції - 160.0

protocol Observer1: AnyObject {
    func didUpdatePrice(_ newPrice: Double, isGrow : Bool)
}

class CurrencyTracker {
    private var observers = [Observer1]()
    
    private(set) var price: Double{
        didSet {
            notifyObservers()
        }
    }
    var isPriceGrow : Bool = false
    
    init(price: Double) {
        self.price = price
    }
    
    func addObserver(_ observer: Observer1) {
        observers.append(observer)
    }
    func removeObserver(_ observer: Observer1) {
        observers.removeAll {$0 === observer }
    }
    func updateCurrency(newPrice: Double) {
        isPriceGrow = newPrice > price
        price = newPrice
    }
    
    private func notifyObservers() {
        for observer in observers {
            observer.didUpdatePrice(price, isGrow: isPriceGrow)
        }
    }
    
}

class GraphUpdater:Observer1 {

    func didUpdatePrice(_ newPrice: Double, isGrow: Bool) {
        var isPriceGrow = isGrow ? "Зросла" : "Впала"
        print("Нова ціна \(isPriceGrow) та становить \(newPrice)")
    }
}
class NotificationSender:Observer1 {
    
    func didUpdatePrice(_ newPrice: Double, isGrow: Bool) {
        print("Нова ціна становить \(newPrice) ")
    }
}

var graph = GraphUpdater()
var senderNotification = NotificationSender()

var stack2 = CurrencyTracker(price: 41.5)
stack2.addObserver(graph)
stack2.addObserver(senderNotification)

stack2.updateCurrency(newPrice: 45)

class House {
    var rooms: Int
    var floors: Int
    var hasGarden: Bool
    var hasSwimmingPool: Bool
    
    init(rooms: Int, floors: Int, hasGarden: Bool, hasSwimmingPool: Bool) {
        self.rooms = rooms
        self.floors = floors
        self.hasGarden = hasGarden
        self.hasSwimmingPool = hasSwimmingPool
    }
}
class HouseBuilder {
    private var rooms = 0
    private var floors = 1
    private var hasGarden = false
    private var hasSwimmingPool = false
    
    func setRooms(_ count: Int) -> HouseBuilder {
        self.rooms = count
        return self
    }
    
    func setFloors(_ count: Int) -> HouseBuilder {
        self.floors = count
        return self
    }
    
    func addGarden() -> HouseBuilder {
        hasGarden = true
        return self
    }
    
    func addPool() -> HouseBuilder {
        self.hasSwimmingPool = true
        return self
    }
    
    func build() -> House {
        return House(rooms: rooms, floors: floors, hasGarden: hasGarden, hasSwimmingPool: hasSwimmingPool)
    }
    
}

let myHouse = HouseBuilder()
    .setFloors(1)
    .setRooms(4)
    .addGarden()
    .build()

myHouse.hasGarden


protocol OldLocationProtocol {
    var latitude:Float {get set}
    var longtitude:Float {get set}
}
struct OldGeoService:OldLocationProtocol {
    private var _latitude:Float = 0
    private var _longtitude:Float = 0
    
    var latitude:Float {
        
        get { _latitude }
        
        set {
            if newValue >= -90  && newValue <= 90 {
                _latitude = newValue
            } else {
                print("Значення вне діапозоні")
            }
        }
    }
    
    var longtitude:Float {
        
        get { _longtitude }
        
        set {
            if newValue >= -180  && newValue <= 180 {
                _longtitude = newValue
            } else {
                print("Значення вне діапозоні")
            }
        }
    }

}

protocol NewLocationProtocol {
    var latitude:String {get set}
    var longtitude:String {get set}
}
struct NewGeoService:NewLocationProtocol {
    var latitude:String = "41 24.2028" {
        didSet {
            if  !validateLatitude(latitude) {
                latitude = oldValue
            }
        }
    }
    var longtitude:String = "2 10.4418" {
        didSet {
            if  !validateLongitude(longtitude) {
                longtitude = oldValue
            }
        }
    }
    
    
    private func validateLatitude(_ latitude: String) -> Bool {

        let pattern = #"^-?(90|[0-8]?[0-9])\s([0-5]?[0-9](\.\d+)?)$"#
        
        let regex = try? NSRegularExpression(pattern: pattern)
        let range = NSRange(location: 0, length: latitude.utf16.count)
        

        if let match = regex?.firstMatch(in: latitude, options: [], range: range) {
            return match.range.location != NSNotFound
        }
        
        return false
    }
    
    private func validateLongitude(_ longitude: String) -> Bool {

        let pattern = #"^-?(180|1[0-7][0-9]|[0-9]?[0-9]?[0-9])\s([0-5]?[0-9](\.\d+)?)$"#
        
        let regex = try? NSRegularExpression(pattern: pattern)
        let range = NSRange(location: 0, length: longitude.utf16.count)

        if let match = regex?.firstMatch(in: longitude, options: [], range: range) {
            return match.range.location != NSNotFound
        }
        
        return false
    }
    
}


// Базовий протокол для всіх команд
protocol Command {
    func execute()
}

// Конкретна команда для ввімкнення світла
class LightOnCommand: Command {
    private let light: Light

    init(light: Light) {
        self.light = light
    }

    func execute() {
        light.turnOn()
    }
}

// Конкретна команда для вимкнення світла
class LightOffCommand: Command {
    private let light: Light

    init(light: Light) {
        self.light = light
    }

    func execute() {
        light.turnOff()
    }
}

// Приймач, який реалізує дії
class Light {
    func turnOn() {
        print("Світло ввімкнено")
    }

    func turnOff() {
        print("Світло вимкнено")
    }
}

// Виконавець, який може виконувати команди
class RemoteControl {
    private var commands: [Command] = []

    func addCommand(_ command: Command) {
        commands.append(command)
    }

    func executeCommands() {
        for command in commands {
            command.execute()
        }
        commands.removeAll()
    }
}

// Приклад використання
let light = Light()
let lightOn = LightOnCommand(light: light)
let lightOff = LightOffCommand(light: light)

let remote = RemoteControl()
remote.addCommand(lightOn)
remote.addCommand(lightOff)
remote.executeCommands()


protocol SortingStrategy {
    func sort(_ array: [Int]) -> [Int]
}

class QuikSortingStrategy: SortingStrategy {
    func sort(_ array: [Int]) -> [Int] {
        return array.sorted()
    }
}


class BubleSortingStrategy: SortingStrategy {
    
    func sort(_ array: [Int]) -> [Int] {
        
        var sortedArray = array
        for i in 0..<sortedArray.count {
            for k in 0..<sortedArray.count-i-1 {
                if sortedArray[k] > sortedArray[k+1] {
                    sortedArray.swapAt(k, k+1)
                }
            }
        }
        return sortedArray
    }
}

class Sorter {
    private var strategy: SortingStrategy
    
    init(strategy: SortingStrategy) {
        self.strategy = strategy
    }
    
    func setSrategy(strategy: SortingStrategy) {
        self.strategy = strategy
    }
    func sortArray(_ array: [Int]) -> [Int] {
        return strategy.sort(array)
    }
}

var sorter = Sorter(strategy: QuikSortingStrategy())
var sortedArr = sorter.sortArray([2,1,7,5,2])
print(sortedArr)

sorter.setSrategy(strategy: BubleSortingStrategy())

sortedArr = sorter.sortArray([1,45,3])
print(sortedArr)



// Шаблонний метод

class BeverageTemplate {
    // Шаблонний метод
    func prepareBeverage() {
        boilWater()
        pourInCup()
        addIngredients()
        stir()
    }
    
    func boilWater() {
        print("Нагріваємо воду до кипіння")
    }
    
    func pourInCup() {
        print("Наливаємо воду в чашку")
    }
    
    func stir() {
        print("Перемішуємо напій")
    }
    
    // Метод, що має бути реалізований у підкласах
    func addIngredients() {
        fatalError("Цей метод має бути реалізований у підкласі")
    }
}

class Tea: BeverageTemplate {
    override func addIngredients() {
        print("Додаємо чайний пакетик")
    }
}

class Coffee: BeverageTemplate {
    override func addIngredients() {
        print("Додаємо каву та цукор")
    }
}
class HotChocolate: BeverageTemplate {
    override func addIngredients() {
        print("Додаємо какао ")
    }
}

let tea = Tea()
print("Готуємо чай:")
tea.prepareBeverage()

print("\nГотуємо каву:")
let coffee = Coffee()
coffee.prepareBeverage()

let coca = HotChocolate()
coca.prepareBeverage()



let result = {
    (a: Int, b: Int) in return
    a + b
}

print(result(10,4))


//Відправляю запит 1:
//Level 1: Обробив запит: Простий запит
//
//Відправляю запит 2:
//Level 1: Не можу обробити запит, передаю далі.
//Level 2: Обробив запит: Складний запит
//
//Відправляю запит 3:
//Level 1: Не можу обробити запит, передаю далі.
//Level 2: Не можу обробити запит, передаю далі.
//Level 3: Обробив будь-який запит: Невідомий запит

//
//protocol SupportHandler {
//    var nextHandler: SupportHandler? {get set}
//    func handleRequest(_ request: String)
//    func setNext(handler: SupportHandler) -> SupportHandler
//}
//
//class BaseHandler:SupportHandler {
//    
//    var nextHandler:SupportHandler?
//    
//    func setNext(handler:SupportHandler) -> SupportHandler {
//        self.nextHandler = handler
//        return handler
//    }
//    
//    func handleRequest(_ request: String) {
//        if let next = nextHandler {
//            next.handleRequest(request)
//        } else {
//            print("Запит не оброблений: \(request)")
//        }
//    }
//    
//}
//
//class LevelOneSupport: BaseHandler {
//    override func handleRequest(_ request: String) {
//        if request == "Простий запит" {
//            print("Level 1: Обробив запит: \(request)")
//        } else {
//            print("Level 1: Не можу обробити запит, передаю далі")
//            super.handleRequest(request)
//        }
//    }
//}
//
//class LevelTwoSupport: BaseHandler {
//    override func handleRequest(_ request: String) {
//        if request == "Складний запит" {
//            print("Level 2: Обробив запит: \(request)")
//        } else {
//            print("Level 2: Не можу обробити запит, передаю далі")
//            super.handleRequest(request)
//        }
//    }
//}
//
//class LevelThreeSupport: BaseHandler {
//    override func handleRequest(_ request: String) {
//            print("Level 3: Обробив будь-який запит: \(request)")
//    }
//}
//
//var levelOne = LevelOneSupport()
//var levelTwo = LevelTwoSupport()
//var levelThree = LevelThreeSupport()
//
//levelOne.setNext(handler: levelTwo).setNext(handler: levelThree)
//
//levelOne.handleRequest("Невідомий запитю")


// Протокол для посередника
protocol ChatMediator {
    func sendMessage(_ message: String, from user: User1)
    func addUser(_ user: User1)
}

// Посередник
class ChatRoom: ChatMediator {
    private var users: [User1] = []
    
    func addUser(_ user: User1) {
        users.append(user)
        print("\(user.name) приєднався до чату.")
    }
    
    func sendMessage(_ message: String, from user: User1) {
        for u in users {
            if u !== user {
                u.receive(message: message, from: user.name)
            }
        }
    }
}

// Абстракція для користувача
class User1 {
    let name: String
    private var chatRoom: ChatMediator
    
    init(name: String, chatRoom: ChatMediator) {
        self.name = name
        self.chatRoom = chatRoom
        chatRoom.addUser(self)
    }
    
    func send(message: String) {
        print("\(name) надсилає: \(message)")
        chatRoom.sendMessage(message, from: self)
    }
    
    func receive(message: String, from sender: String) {
        print("\(name) отримав повідомлення від \(sender): \(message)")
    }
}

// Використання
let chatRoom = ChatRoom()

let user01 = User1(name: "Аліна", chatRoom: chatRoom)
let user02 = User1(name: "Євген", chatRoom: chatRoom)
let user03 = User1(name: "Олег", chatRoom: chatRoom)

user01.send(message: "Привіт, усім!")
user02.send(message: "Привіт, Аліна!")
user03.send(message: "Доброго дня!")
