//: Playground - noun: a place where people can play

import UIKit

enum Operation {
    case UnaryOperation(Double->Double)
    case BinaryOperation((Double,Double)->Double)
}

var ops = [String: Operation]()
ops["+"] = Operation.BinaryOperation(+)
ops["-"] = Operation.BinaryOperation(-)
ops["x"] = Operation.BinaryOperation(*)
ops["/"] = Operation.BinaryOperation(/)
ops["√"] = Operation.UnaryOperation(sqrt)

func doOp(op:String, n: Double...) -> Double? {
    if let operation = ops[op] {
        switch operation {
        case .UnaryOperation(let f): return f(n[0])
        case .BinaryOperation(let f): return f(n[0],n[1])
        }
    }
    return nil
}

doOp("+", 1, 2)
doOp("√", 3)
doOp("$", 5, 6)
