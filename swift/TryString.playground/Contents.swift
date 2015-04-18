//: Playground - noun: a place where people can play

import UIKit

extension String {
    subscript(index: Int) -> Character {
        let idx = advance(startIndex, index)
        return self[idx]
    }
    subscript(range: Range<Int>) -> String {
        let start = advance(startIndex, range.startIndex)
        let end = advance(startIndex, range.endIndex)
        return self[start..<end]
    }
}

var name="超級厲害"

name[0]
name[2...3]