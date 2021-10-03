import UIKit

//
//  main.swift
//  1l_ШмондрикКонстантин.playground
//
//  Created by Константин Шмондрик on 23.09.2021.
//
import Darwin.C.math
// 1 Квадратное уравнение
// ax^2+bx+c=0

let a: Double = 5
let b: Double = 20
let c: Double = 9
var D: Double = pow(b,Double(2)) - (a * c * 4) // расчет дискриминанта D=b^2-4ac

if D < 0 {
    print("D<0 Уравнение не имеет корней")
} else if D == 0 {
    let x1 = -b / (2 * a)
    print("D= " + String(D) + " x = " + String(x1))
} else if D > 0 {
    let x1: Double = (-b + sqrt(D)) / (2 * a)
    let x2: Double = ( -b - sqrt(D)) / (2 * a)
    print( "D= " + String(D) + " x1 = " + String(x1) + " x2 = " + String(x2))
}

// 2 Площадь, периметр и гипотенуза прямоугольного теугольника

let katet1: Double = 56
let katet2: Double = 30
var square = katet1 * katet2 / 2 // Площадь

var hypotenuse = sqrt(pow(katet1, Double(2)) + pow(katet2, Double(2)))
var perimeter = katet1 + katet2 + hypotenuse

print("Площадь = " + String(square))
print("Гипотенуза = " + String(hypotenuse))
print("Периметр = " + String(perimeter))


// 3 Сумма вклада через 5 лет

var deposit: Double = 100 // первоначальный вклад
let year = 5 // срок депазита
let rate: Double = 10 // годовой процент по вкладу

for _ in (1...year) {
    deposit = deposit * ( 1 + rate/100 )
}
print("Вклад через " + String(year) + " составит: " + String(deposit))







