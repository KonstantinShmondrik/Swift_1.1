import UIKit

// Кофе машина на данный момент производит Эспрессо, Американо и Латте

enum CoffyMashineError: Error {
    case invalideSelection                          // Товара нет в наличии
    case outOfWater                                 // Вода закончилась
    case outOfMilk                                  // Молоко закончилось
    case insufficientFunds (coinsNeeded: Int)       // Недостаточно денег
    
}

struct Item {
    var price: Int                  // Цена
    let product: Product
    var waterSpan: Int              // Расход воды в мл
    var milkSpan: Int               // Расход молока в мл
    
}

struct Product {
    let name: String
}

class CoffyMashine {
    
    var inventory = [
        "Espresso" : Item(price: 50, product: Product(name: "Espresso"), waterSpan: 30, milkSpan: 0),
        "Americano" : Item(price: 100, product: Product(name: "Americano"), waterSpan: 200, milkSpan: 0),
        "Latte" : Item(price: 150, product: Product(name: "Latte"), waterSpan: 100, milkSpan: 100)
    ]
    
    var coinsDeposited = 0         // Количество денег, внесенное покупателем
    var water = 5000               // Изначальный объем воды в машине
    var milk = 200                // Изначальный объем молока в машине
    
    func vend(itemNamed name: String) throws -> Product {
        
        guard let item = inventory[name] else {
//            print("Данного напитка нет в наличии")
            throw CoffyMashineError.invalideSelection
        }
        
        water -= item.waterSpan
        milk -= item.milkSpan
        
        guard water > 0 else {
//            print("Извините, закончилась вода")
            throw CoffyMashineError.outOfWater
            
        }
        
        guard milk > 0 else {
//            print("Извините, закончилoсь молоко")
            throw CoffyMashineError.outOfMilk
            
        }
        
        guard item.price <= coinsDeposited else {
//            print("Извините, денег недостаточно, внесите еще \(item.price - coinsDeposited) рублей")
            throw CoffyMashineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }
        
        coinsDeposited -= item.price

        
        print("Ваш \(item.product.name) готов. Осторожно, горячо! ")
        print("На вашем счету осталось: \(coinsDeposited) рублей")

        return item.product
    }
}
    

let coffyMashine = CoffyMashine ()
    do {
    try coffyMashine.vend(itemNamed: "Сappuccino")
       
    } catch CoffyMashineError.invalideSelection {
        print("Данного напитка нет в наличии")
    } catch CoffyMashineError.outOfWater {
        print("Извините, закончилась вода")
    } catch CoffyMashineError.outOfMilk {
        print("Извините, закончилoсь молоко")
    } catch CoffyMashineError.insufficientFunds(let coinsNeeded) {
        print("Извините, денег недостаточно, внесите еще \(coinsNeeded) рублей")
    }

print("======")

do {
try coffyMashine.vend(itemNamed: "Americano")
   
} catch CoffyMashineError.invalideSelection {
    print("Данного напитка нет в наличии")
} catch CoffyMashineError.outOfWater {
    print("Извините, закончилась вода")
} catch CoffyMashineError.outOfMilk {
    print("Извините, закончилoсь молоко")
} catch CoffyMashineError.insufficientFunds(let coinsNeeded) {
    print("Извините, денег недостаточно, внесите еще \(coinsNeeded) рублей")
}
print("======")
coffyMashine.coinsDeposited = 350

do {
try coffyMashine.vend(itemNamed: "Americano")
   
} catch CoffyMashineError.invalideSelection {
    print("Данного напитка нет в наличии")
} catch CoffyMashineError.outOfWater {
    print("Извините, закончилась вода")
} catch CoffyMashineError.outOfMilk {
    print("Извините, закончилoсь молоко")
} catch CoffyMashineError.insufficientFunds(let coinsNeeded) {
    print("Извините, денег недостаточно, внесите еще \(coinsNeeded) рублей")
}
print("======")

do {
try coffyMashine.vend(itemNamed: "Latte")
   
} catch CoffyMashineError.invalideSelection {
    print("Данного напитка нет в наличии")
} catch CoffyMashineError.outOfWater {
    print("Извините, закончилась вода")
} catch CoffyMashineError.outOfMilk {
    print("Извините, закончилoсь молоко")
} catch CoffyMashineError.insufficientFunds(let coinsNeeded) {
    print("Извините, денег недостаточно, внесите еще \(coinsNeeded) рублей")
}
print("======")

do {
try coffyMashine.vend(itemNamed: "Latte")
   
} catch CoffyMashineError.invalideSelection {
    print("Данного напитка нет в наличии")
} catch CoffyMashineError.outOfWater {
    print("Извините, закончилась вода")
} catch CoffyMashineError.outOfMilk {
    print("Извините, закончилoсь молоко")
} catch CoffyMashineError.insufficientFunds(let coinsNeeded) {
    print("Извините, денег недостаточно, внесите еще \(coinsNeeded) рублей")
}
print("======")
/*
//let coffyMashine = CoffyMashine ()
try?coffyMashine.vend(itemNamed: "Сappuccino")
print("======")
try?coffyMashine.vend(itemNamed: "Americano")
print("======")
coffyMashine.coinsDeposited = 350
print("======")
try?coffyMashine.vend(itemNamed: "Americano")
print("======")
try?coffyMashine.vend(itemNamed: "Latte")
print("======")
try?coffyMashine.vend(itemNamed: "Latte")
print("======")

*/
