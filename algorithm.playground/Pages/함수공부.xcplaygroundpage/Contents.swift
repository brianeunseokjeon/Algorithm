import Foundation

// factorial
func factorial(input n:Int) -> Int {
    guard n > 0 else { return 0 }
    if n == 1 {
        return 1
    } else {
        return factorial(input:n-1) * n
    }
}

//fibonachi
var count = 0
func fibonachi(input n:Int) -> Int {
    guard n > 0 else { return 0 }
    if n == 1 || n == 2 {
        return 1
    } else {
        return fibonachi(input: n-1) + fibonachi(input: n-2)
    }
}
fibonachi(input: 8)
