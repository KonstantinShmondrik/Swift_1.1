import UIKit
import Darwin

struct Queue<T:Comparable> {
    var items = [T]()
    mutating func enqueue (_ item: T){
        items.append(item)
    }
    mutating func dequeue() -> T?{
        print("Следующий в очереди: \(items.first!)")
        return items.removeFirst()
    }
    
    func filter(item: T) {
        print("Найдено: \(items.filter{$0 == item }) его очередь: \(items.count)")
    }
    
    func sortA_Z() {
        print("Очередь отсортирована: \(items.sorted{$0 < $1})")
    }
    
    func printCount(){
        print("Людей в очереди: \(items.count)")
    }
    
    subscript (i: Int) -> T? {
        return (i < items.count ? items[i] : nil)
    }
}

var queueOfCustomers = Queue<String>()
queueOfCustomers.enqueue("Николай")
queueOfCustomers.enqueue("Анна")
queueOfCustomers.enqueue("Олег")
queueOfCustomers.enqueue("Ольга")
queueOfCustomers.enqueue("Егор")
queueOfCustomers.printCount()

print(queueOfCustomers.items)

queueOfCustomers.dequeue()
queueOfCustomers.dequeue()

print(queueOfCustomers.items)

queueOfCustomers.enqueue("Юлия")
queueOfCustomers.enqueue("Яков")
queueOfCustomers.enqueue("Дмитрий")

print(queueOfCustomers.items)

queueOfCustomers.dequeue()
queueOfCustomers.dequeue()
queueOfCustomers.dequeue()
queueOfCustomers.enqueue("Борис")
queueOfCustomers.sortA_Z()
queueOfCustomers.filter(item: "Яков")

var queueOfCustomersSort = queueOfCustomers

print(queueOfCustomers.items)

var sortCastomer = queueOfCustomers.items.sorted() {$0 < $1}
print(sortCastomer)


queueOfCustomers.items.forEach(){print($0)}

print(queueOfCustomers.items)
var nomber:Int = 2
print("В очереди под номером \(nomber) \(queueOfCustomers[nomber])")
nomber = 5
print("В очереди под номером \(nomber) \(queueOfCustomers[nomber])")


