import UIKit

// 1 Определяем четное число или нет

func evenNumber(_ a : Int) {
    if a % 2 == 0 {
        print(a, " четное число")
    } else {
        print(a, " нечетное число")
    }
}
let a = 9
//let b = 10
evenNumber(a)

// 2 Определяем чило, которое делется без остатка на 3

func divisionByThree(_ a : Int) {
    if a % 3 == 0 {
        print(a, "делится на 3 без остатка")
    } else {
        print(a, "не делится на 3 без остатка")
    }
}

divisionByThree(a)

// 3 Создаем возрастающий массив из 100 чисел

var someArray = Array(1...100)
    
// 4 Удаляем из массива все четные числа и все числа, которые не делятся на 3

var someArrayFilter = someArray.filter( {$0 % 2 != 0 && $0 % 3 != 0} )
    print(someArrayFilter)

// 5 Функция, добавляющая число Фибоначи

func fibonacci (n: Int) -> [Int]  {
    var fibonacciArr = [Int]()
    for n in 0 ... n {
        if n == 0 {
            fibonacciArr.append(0)
        }
        else if n == 1 {
            fibonacciArr.append(1)
        }
        else {
            fibonacciArr.append (fibonacciArr[n-1] + fibonacciArr[n-2] )
        }
    }
    return fibonacciArr
}
print(fibonacci(n: 50))


// 6 массив натуральных простых чисел

var simpleArray = [Int](2...100)

for p in simpleArray {
    for i in simpleArray {
        if i % p == 0 && i != p {
        simpleArray.remove(at: simpleArray.firstIndex(of: i)!)
        }
    }
}
print(simpleArray)
