import UIKit

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
class Car{
    var carBrand: String                                // Бренд автомобиля
    var yearOfIssue: Int                                // год выпуска
    var engineCondition: engineCondition                // состояние двигателя
    var windowSate: windowSate                          // состояние окон
    
    func actionWindow (action: windowSate){
        switch action{
        case .open:
            print("Окна: \(action.rawValue)")
            self .windowSate = .open
        case .close:
            print("Окна: \(action.rawValue)")
            self .windowSate = .close
        }
    }
    
    func actEngine (action: engineCondition){
        switch action{
        case .on:
            print("Двигатель: \(action.rawValue)")
            self .engineCondition = .on
        case .off:
            print("Двигатель: \(action.rawValue)")
            self .engineCondition = .off
        }
    }
    
    init (carBrand: String, yearOfIssue: Int, engineCondition: engineCondition, windowSate: windowSate){
        self.carBrand = carBrand
        self.yearOfIssue = yearOfIssue
        self.engineCondition = engineCondition
        self.windowSate = windowSate
        
    }
}

class sportCar: Car{                                    // Класс: лгковой авто
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
    init(carBrand: String,yearOfIssue: Int, engineCondition: engineCondition, windowSate: windowSate, trunkVolume: Double, bootLoading: Double){
    self.trunkVolume = trunkVolume
    self.bootLoading = bootLoading
    
        super.init (carBrand: carBrand, yearOfIssue: yearOfIssue, engineCondition: engineCondition, windowSate: windowSate)
    }
    override func actEngine(action: engineCondition) {
        super.actEngine(action: engineCondition)
        switch action{
        case .on:
            print("Это демонстрационный образец. Двигатель завести невозможно")
        case .off:
            print("Двигатель: \(action.rawValue)")
            self .engineCondition = .off
        }
    }
    deinit{
        print("Легкового автомобиля больше нет")
    }
}

class trunkCar: Car{                                    // Класс: грузовой авто
    var bodyVolume: Double                              // объем кузова
    var bodyLoading: Double{                            // загрузка кузова
        didSet{
            let fullness = bodyVolume - bodyLoading
            if fullness < 0{
                print("Кузов переполнен на: \(fullness * (-1)) м3")
            } else{
                print("Свободного места в кузове осталось: \(fullness) м3")
            }
        }
    }
    init(carBrand: String,yearOfIssue: Int, engineCondition: engineCondition, windowSate: windowSate, bodyVolume: Double, bodyLoading: Double){
    self.bodyVolume = bodyVolume
    self.bodyLoading = bodyLoading
        super.init (carBrand: carBrand, yearOfIssue: yearOfIssue, engineCondition: engineCondition, windowSate: windowSate)
    }
    
    override func actionWindow(action: windowSate) {
        super.actionWindow(action: windowSate)
        switch action{
        case .open:
            print("На даннй модели окна не открываются")
        case .close:
            print("Окна: \(action.rawValue)")
            self .windowSate = .close
        }
        
    }
    deinit{
        print("Грузового автомобиля больше нет")
    }
}


var car1 = Car(carBrand: "Volvo", yearOfIssue: 2019, engineCondition: .off, windowSate: .close)

print("Марка автомобиля: \(car1.carBrand); Год выпуска: \(car1.yearOfIssue); Состояние двигателя: \(car1.engineCondition.rawValue); Состояние окон: \(car1.windowSate.rawValue)")

var car2 = sportCar(carBrand: "Audi TT", yearOfIssue: 2013, engineCondition: .off, windowSate: .close, trunkVolume: 100, bootLoading: 0)
print("Марка автомобиля: \(car2.carBrand); Год выпуска: \(car2.yearOfIssue); Объем багажника: \(car2.trunkVolume) л; Загрузка багажника: \(car2.bootLoading) л; Состояние двигателя: \(car2.engineCondition.rawValue); Состояние окон: \(car2.windowSate.rawValue)")
var car3 = trunkCar(carBrand: "KAMAZ", yearOfIssue: 1999, engineCondition: .off, windowSate: .close, bodyVolume: 6, bodyLoading: 0)
print("Марка автомобиля: \(car3.carBrand); Год выпуска: \(car3.yearOfIssue); Объем кузова: \(car3.bodyVolume) м3; Загрузка кузова: \(car3.bodyLoading) м3; Состояние двигателя: \(car3.engineCondition.rawValue); Состояние окон: \(car3.windowSate.rawValue)")

print(car2.yearOfIssue)

car2.actionWindow(action: .open)

car3.actionWindow(action: .open)
car3.actEngine(action: .on)

car2.actEngine(action: .on)
car1.actionWindow(action: .open)
car1.actEngine(action: .on)

var car4 = car2
car2.yearOfIssue = 2017
print("Марка автомобиля: \(car4.carBrand); Год выпуска: \(car4.yearOfIssue); Объем багажника: \(car4.trunkVolume) л; Загрузка багажника: \(car4.bootLoading) л; Состояние двигателя: \(car4.engineCondition.rawValue); Состояние окон: \(car2.windowSate.rawValue)")
var car5 = trunkCar(carBrand: "URAL", yearOfIssue: 1986, engineCondition: .on, windowSate: .open, bodyVolume: 30, bodyLoading: 0)
print("Марка автомобиля: \(car5.carBrand); Год выпуска: \(car5.yearOfIssue); Объем кузова: \(car5.bodyVolume) м3; Загрузка кузова: \(car5.bodyLoading) м3; Состояние двигателя: \(car5.engineCondition.rawValue); Состояние окон: \(car5.windowSate.rawValue)")
car5.actionWindow(action: .close)
car5.actionWindow(action: .open)
car4.bootLoading = 68


