import Foundation

var name1: String = "2.2"
var name2:NSString = "2.2"

extension String {
    var doubleValue: Double {
        return (self as NSString).doubleValue
    }
}

name1.doubleValue
