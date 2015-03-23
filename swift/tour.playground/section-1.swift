// Playground - noun: a place where people can play

import UIKit

for var i = 0; i < 10; i++ {
        print(i)
}
println()

for i in 0..<10 {
    print(i)
}
println()


// function
func average(nums:Int...) -> Int {
    var total = 0
    for num in nums {
        total += num
    }
    return total / nums.count
}
average(1,2,3,4,5)


// function returns function
func makeInc(add_value:Int) -> (num:Int)->Int {
    func add(num:Int) -> Int {
        return num + add_value
    }
    return add
}
var add3 = makeInc(3)
add3(num:7)


// function as argument
func greeting(name:String) {
    println("hello world, \(name)")
}
func greetingx2(greet:(String)->()) {
    greet("swift")
    greet("ruby")
}

greetingx2(greeting)


// closure
var array = [1,2,3,4,5]
array.map({ (num:Int)->Int in
    return num*2
})