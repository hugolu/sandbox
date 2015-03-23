// Playground - noun: a place where people can play

import UIKit


// var and constant
let constant = 10
var variable = 0


// type annotation
var greeting:String = "hello world"


// output
println("hello world")


// it's a single-line comment
/* it's a multiple-line
   comment */


// Integer
let maxValue = Int.max
let minValue = Int.min

var signedInt:Int = 0
var unsignedInt:UInt = 0


// floating number
var float:Float = 3.1415926
var double:Double = 3.1415926


// type inference
let aInt = 43
let aFloat = 43.0
let aString = "43"


// 數值型字面量
let decimalInteger = 17
let binaryInteger = 0b10001       // 二進制的 17
let octalInteger = 0o21           // 八進制的 17
let hexadecimalInteger = 0x11     // 十六進制的 17

let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let hexadecimalDouble = 0xC.3p0

let paddedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1


// 型別別名
typealias AudioSample = UInt16
var maxAmplitudeFound = AudioSample.min


// 布林（Boolean）型別
let orangesAreOrange = true
let turnipsAreDelicious = false


// Tuples
let http404Error = (404, "Not Found")
let (statusCode, statusMessage) = http404Error
statusCode
statusMessage

let http200Status = (statusCode: 200, description: "OK")
println("The status code is \(http200Status.statusCode)")
println("The status message is \(http200Status.description)")


// optional
let possibleNumber = "123"
let convertedNumber = possibleNumber.toInt()    // return Int? or "optional Int"


// optional binding
if let actualNumber = possibleNumber.toInt() {
    println("\(possibleNumber) has an integer value of \(actualNumber)")
} else {
    println("\(possibleNumber) could not be converted to an integer")
}


// nil
var surveyAnswer: String?   // optional default value


// assertions
let age = 3
assert(age >= 0, "A person's age cannot be less than zero")


