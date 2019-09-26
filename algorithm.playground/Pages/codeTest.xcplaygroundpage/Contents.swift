
import Foundation

//0926: Challenge 21
// 양의 정수이며 이진 표현에서 동일한 수의 숫자를 가진 다음으로 높은 숫자와 가장 낮은 숫자를 반환합니다.
// 12 -> 1100 즉 1이 2개 들어갔으니깐, 그다음 1이 2번들어간 수는 10001
// 12보다 작은 1 2개 들어간수는 1010 (10)

var h = 12
let h1 = String(h, radix: 2)
h.nonzeroBitCount

extension Int {
    func oneCount() -> Int {
        var number = self
        var count = 0
        while number > 0 {
            if number%2 == 0 {
                number /= 2
            } else {
                number /= 2
                count += 1
            }
        }
        return count
    }
}

func countingBinary(num:Int) -> (Int,Int) {
    
    let nonzeroCount = num.oneCount()
    var highest = num + 1
    var lowest = num - 1
    while lowest.nonzeroBitCount != nonzeroCount {
        lowest -= 1
    }
    while highest.nonzeroBitCount != nonzeroCount {
        highest += 1
    }
    return (lowest,highest)
}


countingBinary(num: 12)
