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

protocol Car {
    var carBrand: String {get}                                // Бренд автомобиля
    var yearOfIssue: Int {get}                               // год выпуска
    var engineCondition: engineCondition {get set}               // состояние двигателя
    var windowSate: windowSate {get set}                         // состояние окон
    
    func actionWindow () -> String
    func actEngine () -> String
}

extension Car {
    mutating func actionWindow (action: windowSate) {
        switch action{
        case .open:
            print("Окна: \(action.rawValue)")
            self .windowSate = .open
        case .close:
                print("Окна: \(action.rawValue)")
            self .windowSate = .close
           
        }
    }
    
    mutating func actEngine (action: engineCondition){
        switch action{
        case .on:
            print("Двигатель: \(action.rawValue)")
            self .engineCondition = .on
        case .off:
            print("Двигатель: \(action.rawValue)")
            self .engineCondition = .off
        }
    }
}

class SportCar: Car {
    var carBrand: String
    var yearOfIssue: Int
    var engineCondition: engineCondition
    var windowSate: windowSate
    
    func actionWindow() -> String {
        <#code#>
    }
    func actEngine() -> String {
        <#code#>
    }
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
    
    init(carBrand: String, yearOfIssue: Int, engineCondition: engineCondition, windowSate: windowSate, trunkVolume: Double, bootLoading: Double){
        self.carBrand = carBrand
        self.yearOfIssue = yearOfIssue
        self.engineCondition = engineCondition
        self.windowSate = windowSate
        self.trunkVolume = trunkVolume
        self.bootLoading = bootLoading
    }
}


class tunkCar: Car {
    var carBrand: String
    var yearOfIssue: Int
    var engineCondition: engineCondition
    var windowSate: windowSate
    
    func actionWindow() -> String {
        <#code#>
    }
    func actEngine() -> String {
        <#code#>
    }
    
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
    
    init(carBrand: String, yearOfIssue: Int, engineCondition: engineCondition, windowSate: windowSate, bodyVolume: Double, bodyLoading: Double){
        self.carBrand = carBrand
        self.yearOfIssue = yearOfIssue
        self.engineCondition = engineCondition
        self.windowSate = windowSate
        self.bodyVolume = bodyVolume
        self.bodyLoading = bodyLoading
        
    }
}

extension SportCar: CustomStringConvertible {
    var description: String {
        return "Марка автомобиля: \(carBrand); Год выпуска: \(yearOfIssue); Объем багажника: \(trunkVolume) л; Загрузка багажника: \(bootLoading) л; Состояние двигателя: \(engineCondition.rawValue); Состояние окон: \(windowSate.rawValue)"
    }
}

extension tunkCar: CustomStringConvertible{
    var description: String{
        return "Марка автомобиля: \(carBrand); Год выпуска: \(yearOfIssue); Объем кузова: \(bodyVolume) м3; Загрузка кузова: \(bodyLoading) м3; Состояние двигателя: \(engineCondition.rawValue); Состояние окон: \(windowSate.rawValue)"
    }
}


var car1 = SportCar(carBrand: "volvo", yearOfIssue: 2015, engineCondition: .off, windowSate: .close, trunkVolume: 50, bootLoading: 0)

car1.actionWindow(action: .open)
car1.actEngine(action: .on)
car1.bootLoading = 40
print(car1.description)

var car2 = tunkCar(carBrand: "Kamaz", yearOfIssue: 2019, engineCondition: .on, windowSate: .close, bodyVolume: 13, bodyLoading: 0)

car2.actEngine(action: .on)
car2.actionWindow(action: .open)
car2.bodyLoading = 15

print(car2.description)

var car3 = car1
car3.carBrand = "nisan"
car3.bootLoading = 5

print(car3.description)
