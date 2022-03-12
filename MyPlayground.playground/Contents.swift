//// Checkpoint 1
//let celsius = 10.8
//
//var fahrenheit = (celsius * 9)/5 + 32
//
//print("\(celsius) degrees celsius is equal to \(fahrenheit) degrees fahrenheit")
//

////Checkpoint 2
//let arr = ["bob", "sally", "john", "john"]
//print(arr.count)
//print(Set(arr).count)

////Checkpoint 3
//for num in 1...100 {
//    if num.isMultiple(of: 3) {
//        if num.isMultiple(of: 5) {
//            print("FizzBuzz")
//        } else {
//            print("Fizz")
//        }
//    } else if num.isMultiple(of: 5) {
//        print("Buzz")
//    } else {
//        print(num)
//    }
//}

////Checkpoint 4
//enum sqrtError: Error {
//    case bounds, missing
//}
//
//func squareroot(of num: Int) throws -> Int {
//
//    if num < 1 || num > 10_000 {
//        throw sqrtError.bounds
//    }
//
//    for n in 1...10000 {
//        if n * n == num {
//            return n
//        }
//    }
//    throw sqrtError.missing
//
//}
//
//do {
//    print(try squareroot(of: 5))
//} catch sqrtError.bounds {
//    print("out of bounds")
//} catch sqrtError.missing {
//    print("no root")
//}

////Checkpoint 5
//let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49].filter { num in return !num.isMultiple(of: 2)}.sorted {$0 < $1}.map {String($0) + " is a lucky number"}
//
//for num in luckyNumbers {
//    print(num)
//}

////Checkpoint 6
//
//struct Car {
//    var model: String
//    var numberOfSeats: Int
//    var currentGear: Int
//    
//    
//    mutating func changeGear(newGear: Int) {
//        currentGear = newGear
//    }
//}
