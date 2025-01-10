import UIKit

@MainActor
class HotelDataBase {
    static let shared = HotelDataBase()
    
    private var rooms: [Room] = []
    
    private init() {}
    
    func addRoom(_ room: Room) {
        rooms.append(room)
    }
    
    func getRooms () -> [Room] {
        return rooms
    }
    
}


class Room {
    let type: String
    let beds: Int
    let price: Double
    
    init(type: String, beds: Int, price: Double) {
        self.type = type
        self.beds = beds
        self.price = price
    }
}

class RoomBuilder {
    
    private var type: String = "Standart"
    private var beds: Int = 1
    private var price: Double = 100.0

    func setType(_ type: String) -> RoomBuilder {
           self.type = type
           return self
       }
       
    func setBeds(_ beds: Int) -> RoomBuilder {
           self.beds = beds
           return self
       }
       
    func setPrice(_ price: Double) -> RoomBuilder {
           self.price = price
           return self
       }
    func build() -> Room {
        return Room(type: type, beds: beds, price: price)
    }
    
}

protocol RoomFilterStrategy {
    func filter(rooms: [Room]) -> [Room]
}

class FilterByPrice: RoomFilterStrategy {
    
    private let maxPrice: Double
    
    init(maxPrice: Double) {
        self.maxPrice = maxPrice
    }
    
    func filter(rooms: [Room]) -> [Room] {
       return  rooms.filter{ $0.price <= maxPrice }
    }
}

protocol HotelObserver {
    func roomAdded(_ room: Room)
}

class HotelNotificationService: HotelObserver {
    func roomAdded(_ room: Room) {
        print("Кімната додана! Type: \(room.type) за ціною \(room.price)")
    }
}

class HotelFacade {
    private var rooms: [Room] = []
    private var observers: [HotelObserver] = []
    
    
    func addObserver(_ observer: HotelObserver) {
        observers.append(observer)
    }
    
    func removeObserver(_ observer: HotelObserver) {
        observers.removeAll { $0 as AnyObject === observer as AnyObject }
    }
    
    private func notifyObservers(room: Room) {
        for observer in observers {
            observer.roomAdded(room)
        }
    }
    
    func addRoom(_ room: Room) {
        rooms.append(room)
        notifyObservers(room: room)
        
    }
    
    func findRoom(_ stratagy: RoomFilterStrategy) -> [Room] {
        return stratagy.filter(rooms:rooms)
    }
}


var standartRoom = RoomBuilder()
.setType("standart")
.setBeds(1)
.setPrice(100)
.build()

var luxRoom = RoomBuilder()
.setType("Luxury")
.setBeds(2)
.setPrice(500)
.build()

var kidRoom = RoomBuilder()
.setType("Kid room")
.setBeds(3)
.setPrice(300)
.build()

var sexyBoyHotel = HotelFacade()
var clientsNotifications = HotelNotificationService()

sexyBoyHotel.addObserver(clientsNotifications)

sexyBoyHotel.addRoom(standartRoom)
sexyBoyHotel.addRoom(luxRoom)
sexyBoyHotel.addRoom(kidRoom)
var availableRooms = sexyBoyHotel.findRoom(FilterByPrice(maxPrice: 400))

for room in availableRooms {
    
    print("Available room is \(room.type)")
}

