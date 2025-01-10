import UIKit


// Lesson 1.1

let maxSpeed:Int = 120

var currentSpeed = 60

print(maxSpeed,currentSpeed);


// Lesson 1.2

let name: String = "Zheka"

var age: Int = 20

var isEnjoy: Bool = !false

print("Мене звати \(name), мені \(age) років  i я \(isEnjoy ? "люблю" : "не люблю") програмувати")



// Lesson 1.3

let firstName = "Zheka"
let lastName = "Pashinin"

print(firstName + " " + lastName)

// Lesson 1.4

var learningHours: Double = 2
var countLessons: Int = 1
print(Int(learningHours))
print("Я вивчаю свіфт \(learningHours) годин , і пройшов  \(countLessons) уроків ")


// Lesson 1.5
var temp: Double = 17

print( (temp > 20) ? "Тепло" : "Холодно")

// Lesson 2.1

var (width,height) = (40.7,50)
var perimetr = Double()
var square = Double(width) * Double(height)

perimetr = (Double(width) + Double(height)) * 2

print(square,perimetr)

// Lesson 2.2

var tulip = (Int(),Int(),Int(),Int())

var (_,_,a,b) = tulip

a = 20
b = 40
(a,b) = (b,a)

print(a,b)

// Lesson 2.3

var number = Int()
number = -25
print((number > 0 && number <= 100) ? "Входить" : "Не входить")


// Lesson 2.4

print( (number % 2 == 0) ? "парне" : "не парне")


switch number {
case let x where x % 2 == 0:
    print("Парне")
case let x where x % 3 == 0:
    print("Непарне і кратно 3")
case let x where x % 5 == 0:
    print("Непарне і кратно 5")
default:
    print("Непарне")
}

// Lesson 2.5

var num1 = Double(), num2 = Double(), num3 = Double()

var arrNum = [20.5, 40.0, 50.0]

var middleSum = Double(arrNum.reduce(0,+)) / Double(arrNum.count)

print(middleSum);

// Lesson 2.6

var totalSeconds = 3890
print("\(totalSeconds) це \(Double(totalSeconds)/60) хвилин, а також \(Double(totalSeconds)/3600) годин")

// Lesson 2.7

var (isSunny,isWeekend) = (true, true)

print(isSunny && isWeekend ? "Час для пікника" : "Пікнік відкладається")

// Lesson 2.8

var result:Double = 0
result += 10
result * 2
result - 5
result / 3

print (result)

// Lesson 2.9

var weight:Double = 72
var anotherHeight:Double = 170

var BMI = weight/(pow(anotherHeight,2))

switch BMI {
case let x where x < 18.5 :
    print("Недостатня")
    
case let x where x > 18.5 && x<=24.9 :
    print("Норма")
    
case let x where x >= 25 && x <= 29.9 :
    print("Надлишкова")
    
default:
    print("Ожиріння")
}

var x = 10
var z = 20

(x,z) = (z,x)
print(x)
print(z)


// Lesson 3.1

func sayHello(name: String = "Хуй") {
    print("Привіт \(name)")
}

sayHello()

// Lesson 3.2

func doSum(args: [Int] = [0]) -> Int {
    return args.reduce(0,+)
}

print(doSum(args:[1,2,3,4]))
print(doSum())

// Lesson 3.3

func isEven(num:Int) -> Bool {
    return (num % 2 == 0) ? true : false
}

print(isEven(num: 2))

// Lesson 3.4

func calculateCircleArea(radius:Double) -> Double {
    return 3.14 * pow(radius,2)
}

print(calculateCircleArea(radius: 2.5))

// Lesson 3.5

func celsiusToFahrenheit(temp:Double) -> Double {
    return temp * 1.8 + 32
}

enum tempType {
    case cel
    case fahren
}

func parseTemp (temp:Double, type: tempType = .cel) -> Double {
    switch type {
    case .cel : return temp * 1.8 + 32
    case .fahren : return (temp - 32) / 1.8
    }
}

print(parseTemp(temp: 40, type:.fahren))

// Lesson 3.6

func sayHello () -> String {
    return "Hello world"
}

// Lesson 3.7

func isNumberInRange(num:Double,min:Int,max:Int) {
    (num >= Double(min)) && (num <= Double(max) ) ? print("Входить") : print("Не входить")
}

isNumberInRange(num: 4.8, min: 2, max: 5)

// Lesson 3.8

func getFullName(name:String,lastName:String) -> String {
    return "\(name) \(lastName)"
}

// Lesson 3.9

func maxOfTwo(a:Double, b:Double) -> Double {
    return (a>b) ? a : b
}

print(maxOfTwo(a: 2, b: 4.9))

// Lesson 3.10

func countCharacters(str:String) -> Int {
    return str.count
}

print(countCharacters(str:"ХУЙ"))


// Lesson 4.1

func getTotalEven(min: Int, max: Int) -> Int {
    var count = 0
    for i in min...max {
        if (i % 2 == 0) {
            count = count + i
        }
        print(count,i)
    }
    return count
}

print(getTotalEven(min: 0, max: 6))

// Lesson 4.2

func changeDiraction(min: Int, max: Int) -> Int {
    var count = max
    while (min <= count) {
        print(count)
        count = count - 1
    }
    return count
}

changeDiraction(min: 1, max: 9)


// Lesson 4.3  [2,3,4,5,6,7,8,9,10,11,12,13,14,15]
// [2]
// [2,3]
// [2,3,5]


func getSimpleNumbers() -> [Int] {
    var count = [2]
    
    outerLoop: for i in 3...50  {
        
        
        for k in count {
            if( i % k == 0) {
                continue outerLoop
            }
        }
        count.append(i)
        
    }
    
    
    return count
    
}

func getSimpleNumbersInterval(min:Int, max:Int) -> [Int] {
    var count = [Int]()
    var count2 = [Int]()
    
    for n in 2...min-1 {
        count.append(n)
    }
    
    print(count)
    
    outerLoop: for i in min...max  {
        
        
        for k in count {
            if( i % k == 0) {
                continue outerLoop
            }
        }
        count.append(i)
        count2.append(i)
        
    }
    
    
    return count2
    
}

print(getSimpleNumbersInterval(min: 6, max: 50))

// 5.0  Enum

// 5.1

enum DayOfWeek {
    case monday,tuesday,wednesday,thursady,friday,saturday,sunday
    
    func isWeekend () -> Bool {
        switch self {
        case .saturday, .sunday :
            return true
        default :
            return false
        }
    }
    
    func dayStatus () {
        isWeekend() ? print("Вихідний") : print("Робочий день")
    }
    
}

func printDayStatus(day: DayOfWeek) {
    day.dayStatus()
}

let monday = DayOfWeek.monday
printDayStatus(day: .monday)
printDayStatus(day: .wednesday)


// 5.2

enum Device {
    
    
    case phone(name:String,model:String)
    case tablet(screenSize:Double)
    case notebook(memory:Int)
    
    func getDeviceInfo() {
        switch self {
        case .phone (let brand, let model)  :
            print("Бренд : \(brand)  Модель: \(model)")
            
        case .tablet(let screenSize) :
             print(screenSize)
            
        case .notebook(let memory):
            print(memory)
        }
    }
    
}


let myPhone = Device.phone(name: "Motorolla", model: "Gold edition")
let myLaptop = Device.notebook(memory: 2)
myPhone.getDeviceInfo()


// 5.3

enum Weather {
    case sunny, rainy,snowy,windy
}

func howToWear(weather:Weather) {
    switch weather {
        case .sunny :
            print ("Іди в трусєлях.")
        case .snowy :
            print ("Вдягни куртку.")
        case .rainy :
            print("Візьми парасольку.")
        case .windy :
            print("Сиди вдома!")
    }
}

howToWear(weather: .sunny)

// 5.4

enum TrafficLight: Int {
    case red = 0, green = 2, yellow = 1
    
    func action() -> String {
        switch self {
        case .red,.yellow: return "зупинись"
        case .green: return "Їдь"
        }
    }
    
    static func getColor(from rawValue:Int) -> TrafficLight? {
        return TrafficLight(rawValue: rawValue)
    }
}

var red = TrafficLight.red

if let light = TrafficLight.getColor(from: 6) {
    print("") }
else {
    print("Значення не в діапозоні")
    }
if let light = TrafficLight.getColor(from: 2) {
    print("Color:\(light)  Instruction:\(light.action()) ") }
else {
    print("Значення не в діапозоні")
}


// 5.6

enum Car {
    case passanger(type:Engine),
         truck(type:Engine),
         sport(type:Engine)
    
    enum Engine:String {
        case benz="Бензиновий",disel="Дизельний",electric = "Електричка"
    }
    
    func getInfo () -> String  {
        switch self {
        case .passanger (let type) :
            return "Легковий  \(type.rawValue)"
        case .truck ( let type) :
            return "Грузовий   \(type.rawValue)"
        case .sport ( let type) :
            return "Спортивний  \(type.rawValue)"
        }
    }
    
}

let honda = Car.passanger(type:.benz)
let bohdan = Car.sport(type: .disel)

print(honda.getInfo())
print(bohdan.getInfo())


enum BankError: Error {
    case insufficientFunds(amountNeeded: Double, message:String)
}

class BankAccount {
    var balance:Double
    var name:String
    
    init(balance: Double, name:String) {
        self.balance = balance
        self.name = name
    }
    
    func makeTransaction(amount:Double,purposeTransaction:String) throws {
        if amount > balance {
            throw BankError.insufficientFunds(amountNeeded: amount - balance, message: "\(purposeTransaction) : оплата не пройшла Гівнюк")
        }
        balance -= amount
        print("Successfully withdrew \(amount). New balance is \(balance)")
    }
    
    
}

var sexyboyAccount = BankAccount(balance: 10_000_000, name:"Sexyboy")

do {
    try sexyboyAccount.makeTransaction(amount: 20_000_000_000,purposeTransaction: "За секс")
    
}  catch  BankError.insufficientFunds(let amountNeeded, let message) {
    
    print("В тебе негативний баланс! \(amountNeeded) стільки грошей тобі не вистачає невдаха!")
    print(message)
    
} catch {
    print("Щось інше, але ти всеодно невдаха! ")
}



class Teacher {
    var name:String
    var id:Int
    var students:[Student] = []
    
    init(name: String, id:Int) {
        self.name = name
        self.id = id
    }
    
    func setStudents(studentArg:StudentArg) {
        
        switch studentArg {
            
        case .single(let student) :
            
            if !self.students.contains(where: {$0.id == student.id}) {
                self.students.append(student)
                student.teachers.append(self)
            }
            
            
        case .multitype(let students) :
            
             for stud in students {
                if !self.students.contains(where: {$0.id == stud.id}) {
                    self.students.append(stud)
                    stud.teachers.append(self)
                }
            }
        }
    }
}
enum StudentArg {
    case single(Student)
    case multitype([Student])
}

class Student {
    var name:String
    var id:Int
    weak var mainTeacher: Teacher?
    var teachers:[Teacher] = []
    
    init(name:String, id:Int) {
        self.name = name
        self.id = id
    }
}

var vahe = Teacher(name: "Vahe", id: 1 )
var gpt = Teacher(name: "GPT 4.0", id: 2)
var sexyboy = Student(name: "Zhenya Sexyboy", id:3)
var stepcha = Student(name: "Serega Stepchenkov ", id:4)
var fima = Student(name: "Fima Sail",id:5)

vahe.setStudents(studentArg: .multitype([sexyboy,stepcha]))

vahe.setStudents(studentArg: .multitype([sexyboy,sexyboy,stepcha,fima]))

vahe.setStudents(studentArg: .single(sexyboy))
vahe.setStudents(studentArg: .single(sexyboy))
vahe.setStudents(studentArg: .single(sexyboy))

print(vahe.students.map{$0.name})
print(sexyboy.teachers.map{$0.name})


struct Stack<SomeElem> {
    
    private var items:[SomeElem] = []
    
    mutating func push(_ item: SomeElem) {
        items.append(item)
    }

    mutating func pop() -> SomeElem? {
        return items.popLast()
    }
    
}

var array = Stack<[Int]>()
array.push([1,3,4,5])


func findIndex<T: Equatable> (from array: [T], _ elem: T) -> Int? {
    
    let index = array.firstIndex(where: {$0 == elem})
    
    return index
}

var index = findIndex(from:["one","two"], "two")
print( index ?? "Не знайдено")

func findMin<T: Comparable> (from array: [T]) -> T? {
    guard var minValue = array.first else {return nil}
    
    for el in array.dropFirst() {
        if el < minValue {
            minValue = el
        }
    }
    
    return minValue
}

var someArray = [3,1,4,6,2,100]

if let minValue = findMin(from: someArray) {
    print(minValue)
} else {
    print("Something went wrong")
}


protocol Identifiable {
    associatedtype IDType: Equatable
    var id : IDType { get }
}

extension Identifiable {
    func isEqual<T: Identifiable>(to obj: T) -> Bool where T.IDType == IDType {
        
        return id == obj.id
        
    }
}

struct User:Identifiable {
    var id: Int
}


var obj1 = User(id: 2)
var obj2 = User(id: 2)
print(obj1.isEqual(to: obj2))


protocol Container {
    associatedtype ItemType: Equatable
    var items: [ItemType] { get set }
    
    mutating func add(_ item: ItemType)
    func contains(_ item: ItemType) -> Bool
}

extension Container {
    mutating func add(_ item: ItemType) {
        items.append(item)
    }
    
    func contains(_ item: ItemType) -> Bool {
        return items.contains(item)
    }
}


struct Stack_01<Type: Equatable>: Container{
    typealias ItemType = Type
    var items: [Type] = []
    mutating func add(_ item: ItemType) {
        items.append(item)
    }
    func contains(_ item: ItemType) -> Bool {
        return items.contains(item)
    }
}

extension Stack_01 where ItemType:Numeric {
    func sum() -> ItemType {
        return items.reduce(0, +)
    }
}

var newStack = Stack_01<String>()


protocol SummableContainer {
    associatedtype itemType: Numeric
    var items: [itemType] { get set }
    
}

extension SummableContainer {
    mutating func add(_ item: itemType) {
        items.append(item)
    }
    func sum() -> itemType {
        return items.reduce(0,+)
    }
}

struct Stack_02<Type : Numeric> : SummableContainer {
    var items: [Type] = []
    var name: String?
}

struct Stack_03<Type:Numeric> {
    var items: [Type] = []
}

var numericStack = Stack_02<Float>()
var numericStackTest = Stack_03<Int>()


numericStack.add(245)
numericStack.add(100)
numericStack.add(-45)
print(numericStack.sum())

protocol Displayable {
    func display()
}

protocol NumericContainer {
    associatedtype ItemType:Numeric
    func calculateTotal() -> ItemType
}


class NumericBox<ItemType:Numeric>: Displayable & NumericContainer {
    
    var items: [ItemType]
    
    init(items:[ItemType]) {
        self.items = items
    }
    func display() {
        print("\(items)")
    }
    func calculateTotal() -> ItemType{
        return items.reduce(0,+)
    }
}

func processItemBox<T: Displayable & NumericContainer> (_ box: T) {
    box.display()
    print(box.calculateTotal())
}
    

var numbersBox = NumericBox(items: [20.5, 10, 15, 4, 0.5])
processItemBox(numbersBox)


protocol EquatableContainer {
    associatedtype ItemType: Equatable
    var items: [ItemType] {get set}
    func contains(_ item:ItemType) -> Bool
}

struct Items<T:Equatable>:EquatableContainer {
    var items: [T] = []
    func contains(_ item:T) -> Bool {
        return  items.contains(item)
    }
    
}

var testItem = Items(items: [1,5,3.5,6,8])

print(testItem.contains(3.5))

struct UniqueItems<T:Equatable>:EquatableContainer {
    var items: [T] = []
    func contains(_ item: T) -> Bool {
        return items.contains(item)
    }
    mutating func push(_ newItem: T)  {
        if !self.contains(newItem) {
            items.append(newItem)
        }
    }
}

var uniqueArray = UniqueItems(items: [2,4,5,3,2,3.5])
uniqueArray.push(3.5)
uniqueArray.push(0)

print(uniqueArray.items)


protocol SummableEquatableContainer: EquatableContainer {
    func sum() -> ItemType
}

struct SummableItems<ItemType:Numeric>:SummableEquatableContainer {
    
    var items: [ItemType] = []
    func contains(_ item: ItemType) -> Bool {
        return items.contains(item)
    }
    func sum() -> ItemType {
        return items.reduce(0,+)
    }
}

var summableItemsTest = SummableItems(items:[5,5])
print(summableItemsTest.sum())



//enum Action {
//    enum Lang:String {
//        case eng = "English"
//        case ua  = "Ukrainian"
//        case fr  = "France"
//    }
//    
//    enum Sound:Int{
//       case up = 1
//       case down = -1
//    }
//    
//    enum Theme{
//        case theme(dark:Bool = false)
//    }
//    
//    func changeLang(lang:Lang.RawValue) -> String {
//        return lang
//    }
//    
//   static func changeSound(initialValue:Int,sound:Sound) -> Int {
//        return (initialValue) > 0 && (initialValue) < 100
//        ? initialValue + sound.rawValue
//        : initialValue
//    }
//
//    
//    //func makeAction()
//}
//
//print(Action.changeSound(initialValue: 89, sound: .down))
//
//@MainActor
//class SettingsManager {
//    
//    static let shared = SettingsManager()
//    
//    var sound:Int = 50
//    var lang:Action.Lang = .eng
//    var theme:Action.Theme = .theme()
//    
//    private init() {}
//    
//    
//    func makeSound(action:Action.Sound) {
//        sound = Action.changeSound(initialValue: self.sound, sound: action)
//    }
//    
//    
//}
//
//var settings = SettingsManager.shared
//
//settings.makeSound(action: .up)
//print(settings.sound)


enum Action {
    case changeLanguage(Language)
    case changeSound(Sound)
    case togleTheme(isDarkMode:Bool)
    
    enum Language:String {
        case eng = "English"
        case ua = "Ukrainian"
        case fr = "French"
    }
    enum Sound:Int {
        case up = 5
        case down = -5
    }
}

@MainActor
class SettingsManager {
    static let shared = SettingsManager()
    
    private init() {}
    
    private(set) var currentLanguage: Action.Language = .eng
    private(set) var currentSoundLevel:Int = 50
    private(set) var isDarkMode:Bool = false
    
    func performAction(_ action: Action) {
        
        switch action {
        case .changeLanguage(let lang) :
            changeLanguage(to: lang)
        case .changeSound(let soundAction):
            changeSoundLevel(by: soundAction)
        case .togleTheme(let changeTheme) :
            changeThemeMode(isDark: changeTheme)
            
        }
        
    }
    
    private func changeLanguage(to lang:Action.Language) {
        currentLanguage = lang
    }
    private func changeSoundLevel(by soundAction:Action.Sound) {
        var newSoundLevel = currentSoundLevel + soundAction.rawValue
        if (newSoundLevel < 0) {
            currentSoundLevel = 0
            return
        }
        currentSoundLevel = currentSoundLevel > 0  && currentSoundLevel < 100  ?  newSoundLevel : currentSoundLevel
    }
    private func changeThemeMode(isDark:Bool) {
        isDarkMode = isDark
    }
    
}

var settings = SettingsManager.shared

settings.performAction(.changeSound(.down))
print(settings.currentSoundLevel)

// Протокол для різних типів медіа-програвачів
protocol Player {
    func play()
}

// Реалізація програвача для аудіо
class AudioPlayer: Player {
    func play() {
        print("Playing audio...")
    }
}

// Реалізація програвача для відео
class VideoPlayer: Player {
    func play() {
        print("Playing video...")
    }
}

// Перерахунок типів медіа для фабрики
enum MediaType {
    case audio
    case video
}


class PlayerFactory {
     static func createPlayer(for type: MediaType) -> Player {
        switch type {
        case .audio:
            return AudioPlayer()
        case .video:
            return VideoPlayer()
        }
    }
}

// Використання фабрики для створення об'єктів
let audioPlayer = PlayerFactory.createPlayer(for: .audio)
audioPlayer.play()

let videoPlayer = PlayerFactory.createPlayer(for: .video)
videoPlayer.play()  



