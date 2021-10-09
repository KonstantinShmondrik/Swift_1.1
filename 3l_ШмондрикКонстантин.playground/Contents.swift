import UIKit

// Структура легкового автомобиля

enum engineCondition: String{
    case on = "Заведен"
    case off = "Заглушен"
    }
enum windowSate: String{
    case open = "Открыты"
    case close = "Закрыты"
}
enum bootLoading{
    case emptyTrunk (empty: String)
    case fullTrunk (full: String)
    case loadedTrunk (volume: Double)
}

enum actionsEngine: String{
    case start
    case turnOff
}
struct sportCar{
    
    var carBrand: String                                // Бренд автомобиля
    var yearOfIssue: Int                                // год выпуска
    var trunkVolume: Double                             // объем багажника
    var bootLoading: Double{                            // загрузка багажника
        didSet{
            let fullness = trunkVolume - bootLoading
            if fullness < 0{
                print("Багажник переполнен на: \(fullness * (-1)) л")
            } else{
                print("Свободного места в багажнике осталось: \(fullness) л")
            }
        }
    }
    var engineCondition: engineCondition                // состояние двигателя
    var windowSate: windowSate                          // состояние окон
    
    mutating func actionWindow (action: windowSate){
        switch action{
        case .open:
            print(action.rawValue)
            self .windowSate = .open
        case .close:
            print(action.rawValue)
            self .windowSate = .close
        }
    }
    
    mutating func actEngine (action: engineCondition){
        switch action{
        case .on:
            print(action.rawValue)
            self .engineCondition = .on
        case .off:
            print(action.rawValue)
            self .engineCondition = .off
        }
    }
    
    init (carBrand: String,yearOfIssue: Int, trunkVolume: Double, bootLoading: Double, engineCondition: engineCondition, windowSate: windowSate ){
        self.carBrand = carBrand
        self.yearOfIssue = yearOfIssue
        self.trunkVolume = trunkVolume
        self.bootLoading = bootLoading
        self.engineCondition = engineCondition
        self.windowSate = windowSate
        
    }
}

var car1 = sportCar(carBrand: "audi", yearOfIssue: 2010, trunkVolume: 150,bootLoading: 40, engineCondition: .off, windowSate:.close)
var car2 = sportCar(carBrand: "Volvo S60", yearOfIssue: 2020, trunkVolume: 442, bootLoading: 0, engineCondition: .off, windowSate: .open)


print(car1.carBrand)
print("Марка автомобиля: \(car1.carBrand); Год выпуска: \(car1.yearOfIssue); Объем багажника: \(car1.trunkVolume) лтров; Состояние двигателя: \(car1.engineCondition.rawValue); Состояние окон: \(car1.windowSate.rawValue)")
print(car1.bootLoading)
car1.bootLoading = 30
car1.bootLoading = 10
car1.bootLoading = 155

print("Марка автомобиля: \(car2.carBrand); Год выпуска: \(car2.yearOfIssue); Объем багажника: \(car2.trunkVolume) лтров; Состояние двигателя: \(car2.engineCondition.rawValue); Состояние окон: \(car2.windowSate.rawValue)")

car1.yearOfIssue = car2.yearOfIssue
print(car1.yearOfIssue)

car1.windowSate = .open
print(car1.windowSate.rawValue)
car1.actEngine(action: .on)
car2 .actionWindow(action: .open)


// Структура грузового автомобиля
struct trunkCar{
    
    var carBrand: String                                // Бренд автомобиля
    var yearOfIssue: Int                                // год выпуска
    var trunkVolume: Double                             // объем кузова
    var bootLoading: Double{                            // загрузка багажника
        didSet{
            let fullness = trunkVolume - bootLoading
            if fullness < 0{
                print("Кузов переполнен на: \(fullness * (-1)) м3")
            } else{
                print("Свободного места в кузове осталось: \(fullness) м3")
            }
        }
    }
    var engineCondition: engineCondition                // состояние двигателя
    var windowSate: windowSate                          // состояние окон
    
    mutating func actionWindow (action: windowSate){
        switch action{
        case .open:
            print(action.rawValue)
            self .windowSate = .open
        case .close:
            print(action.rawValue)
            self .windowSate = .close
        }
    }
    
    mutating func actEngine (action: engineCondition){
        switch action{
        case .on:
            print(action.rawValue)
            self .engineCondition = .on
        case .off:
            print(action.rawValue)
            self .engineCondition = .off
        }
    }
    
    init (carBrand: String,yearOfIssue: Int, trunkVolume: Double, bootLoading: Double, engineCondition: engineCondition, windowSate: windowSate ){
        self.carBrand = carBrand
        self.yearOfIssue = yearOfIssue
        self.trunkVolume = trunkVolume
        self.bootLoading = bootLoading
        self.engineCondition = engineCondition
        self.windowSate = windowSate
        
    }
}
var car3 = trunkCar(carBrand: "Камаз", yearOfIssue: 2015, trunkVolume: 6, bootLoading: 0, engineCondition: .off, windowSate: .open)
print("Марка автомобиля: \(car3.carBrand); Год выпуска: \(car3.yearOfIssue); Объем кузова: \(car3.trunkVolume) м3; Загрузка кузова: \(car3.bootLoading) м3; Состояние двигателя: \(car3.engineCondition.rawValue); Состояние окон: \(car3.windowSate.rawValue)")

car3.bootLoading = 2
car3.bootLoading = 6.1
car3.actionWindow(action: .close)
car3.actEngine(action: .on)
car3.yearOfIssue = 2021

print("Марка автомобиля: \(car3.carBrand); Год выпуска: \(car3.yearOfIssue); Объем кузова: \(car3.trunkVolume) м3; Загрузка кузова: \(car3.bootLoading) м3; Состояние двигателя: \(car3.engineCondition.rawValue); Состояние окон: \(car3.windowSate.rawValue)")
