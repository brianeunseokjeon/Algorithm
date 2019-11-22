
import Foundation

//0926: Challenge 21
// 양의 정수이며 이진 표현에서 동일한 수의 숫자를 가진 다음으로 높은 숫자와 가장 낮은 숫자를 반환합니다.
// 12 -> 1100 즉 1이 2개 들어갔으니깐, 그다음 1이 2번들어간 수는 10001
// 12보다 작은 1 2개 들어간수는 1010 (10)


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


//countingBinary(num: 1111111)

// 부호없는 8 비트 정수를 받아들이고 정확하게 8 진 이진수를 보유하도록 채워진 이진 역을 반환하는 함수를 만듭니다. 
// 즉 32는 100000 >> 8자리로 만든다음에 00100000 이렇게 한후 역산 시켜라.. 00000100

func power_recur(x:Int, n:Int) -> Int {
    if n == 0 { return 1 } // 요구사항 1 -> 종료조건.
    else if n > 0 { // 양수
        if n % 2 == 0 { return power_recur(x: x, n: n / 2) * power_recur(x: x, n: n / 2) } // 짝수
        else { return x * power_recur(x: x, n: n-1) }
        // 홀수
        // 요구사항 2 -> n - 1 이므로 n 이 -1 씩 작아짐
    }else { return 1 / power_recur(x: x, n: -n) } // 음수
}


extension String {
    func changeInt() -> Int{
        var saveInt = 0
        var count = 0
        if type(of: Int(self) ?? 0) == Int.self {
            for x in self {
                saveInt += Int("\(x)")! * power_recur(x: 2, n: 7-count)
                count += 1
            }
        }
        return saveInt
    }
}

func reverseBinary(num:Int) -> Int {
    var binaryNumber = String(num,radix: 2)
    var widthOfBinaryNumber = binaryNumber.count
    guard widthOfBinaryNumber <= 8 else {return 0}
    let needZeroNumber = 8 - widthOfBinaryNumber
    var tempString = ""
    var result = ""
    if widthOfBinaryNumber != 8 {
        for _ in 1...needZeroNumber {
            tempString += "0"
        }
        tempString += binaryNumber
    } else {
        tempString = binaryNumber
    }
    
    result = String(tempString.reversed())
    return result.changeInt()
    
}



reverseBinary(num: 148)


// write a function that accepts a string and returns true if it contains only numbers.
// 01010101 >> true
// 숫자면 >> true // 아니면 false


// 챌린지 23 스트링값으로 인트 들어가면 true , 그외는 false


func stringToInt(_ InputString:String) -> Bool {
    
    if Int(InputString) != nil {
        return true
    } else {
       return false
    }
}


"""
어떤걸 찾는거냐면 두수를 곱했을 때 원래수보다 일단 작아야되 같으면 답..
근데 하나 더하면 커야되.   그러면 작은수가 답.

먼저 나누기 2를 먼저해 그러면 4겠지? 4를 제곱했더니 16 크니깐
4를 나눠서 2에서 시작. 2를 제곱했더니 4 그런데 크네? 그러니깐
2에서 하나 커짐. 3
3제곱했네? 같음 그러면 끝!

16역시 나누기 2 8제곱 은 크네
그래서 나누기 2 했더니 4
제곱했더니 맞네 오케이

"""
// Challenge 25 :Calculate a square root by hand
func squareRoot(input: Int) -> Int {
    var result = input / 2
    var resultPlusOne = result + 1
    
    while !(result * result < input) || !(resultPlusOne * resultPlusOne > input) {
        guard result * result != input else { return result}
        guard resultPlusOne * resultPlusOne != input else {return resultPlusOne}
        if result * result > input {
            result /= 2
            resultPlusOne = result + 1
        } else {
            result += 1
            resultPlusOne = result + 1
        }
    }
    

    return result
}

//squareRoot(input: 16777216)




// 11/ 22 종이접기문제


func solution1122(_ n:Int) -> [Int] {
    var result: [Int] = []
    var tempResult: [Int] = []
    
    func reverseAndflip(array: [Int]) -> [Int] {
        var temp: [Int] = []
        for x in array.reversed() {
            if x == 0 {
                temp.append(1)
            } else {
                temp.append(0)
            }
        }
        return temp
    }
    for _ in 1...n {
        tempResult = result
        result.append(0)
        result += reverseAndflip(array: tempResult)
    }
    return result
}

solution1122(3)

//
//func solution(_ n:Int) -> [Int] {
//    guard n >= 1 else {return []}
//    var paper:[Bool] = [false]
//    guard n >= 2 else {return [0]}
//    for _ in 2...n {
//
//        let right = paper.map {!$0}.reversed()
//        paper.append(false)
//        paper += right
//    }
//
//    return paper.filterMapToArray { (value) -> Int in
//        return value ? 1 : 0
//    }
//
//}
//extension Array {
//    func filterMapToArray<T>(_ fnc:(_:Element)->T) -> [T] {
//        var result:[T] = [T]()
//        for i in self {
//            result.append(fnc(i))
//        }
//        return result
//    }
//}


//func solution(_ n:Int) -> [Int] {
//    var answer = [false]
//    for _ in 1 ..< n {
//        var newArray = [false]
//        let reversed = answer.reversed().map { $0 ? false : true }
//        newArray = newArray + reversed
//        newArray = answer + newArray
//        answer = newArray
//    }
//    return answer.map { $0 ? 1 : 0 }
//}
