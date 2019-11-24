import UIKit

// 11/18 프로그래머스
// 문제 설명
//
// 수평 직선에 탑 N대를 세웠습니다. 모든 탑의 꼭대기에는 신호를 송/수신하는 장치를 설치했습니다. 발사한 신호는 신호를 보낸 탑보다 높은 탑에서만 수신합니다. 또한, 한 번 수신된 신호는 다른 탑으로 송신되지 않습니다.
//
// 예를 들어 높이가 6, 9, 5, 7, 4인 다섯 탑이 왼쪽으로 동시에 레이저 신호를 발사합니다. 그러면, 탑은 다음과 같이 신호를 주고받습니다. 높이가 4인 다섯 번째 탑에서 발사한 신호는 높이가 7인 네 번째 탑이 수신하고, 높이가 7인 네 번째 탑의 신호는 높이가 9인 두 번째 탑이, 높이가 5인 세 번째 탑의 신호도 높이가 9인 두 번째 탑이 수신합니다. 높이가 9인 두 번째 탑과 높이가 6인 첫 번째 탑이 보낸 레이저 신호는 어떤 탑에서도 수신할 수 없습니다.
// 맨 왼쪽부터 순서대로 탑의 높이를 담은 배열 heights가 매개변수로 주어질 때 각 탑이 쏜 신호를 어느 탑에서 받았는지 기록한 배열을 return 하도록 solution 함수를 작성해주세요.
//
// 제한 사항
// heights는 길이 2 이상 100 이하인 정수 배열입니다.
// 모든 탑의 높이는 1 이상 100 이하입니다.
// 신호를 수신하는 탑이 없으면 0으로 표시합니다.
// 입출력 예
// heights    return
// [6,9,5,7,4]    [0,0,2,2,4]
// [3,9,9,3,5,7,2]    [0,0,0,3,3,3,6]
// [1,5,3,6,7,6,5]    [0,0,2,0,0,5,6]



func solution(_ heights:[Int]) -> [Int] {
    var returnArray: [Int] = heights
    var count = heights.count - 1
    var index = heights.count - 1
    for height in heights.reversed() {
        count -= 1
//        print("index :",index)
        if index == 0 {
            returnArray[index] = 0
            return returnArray
        }
        for x in heights[(0...count)].reversed() {
            if x > height {
//                print("count :",count,"x :", x)
                returnArray[index] = count+1
                break
            }
            if count == 0 {
                returnArray[index] = 0
            }
            count -= 1
        }
//        print("break","count :",count)
        index -= 1
        count = index
    }
    return returnArray
}

//solution([6,9,5,7,4])
//solution([3,9,9,3,5,7,2])
//solution([1,5,3,6,7,6,5])


// 다른사람 풀이
//func solution(_ heights:[Int]) -> [Int] {
//    var result = [Int](repeating: 0, count: heights.count)
//    for i in 0..<heights.count {
//        let index = heights.count-1-i
//        var to = index-1
//        while to >= 0 {
//            if heights[to] > heights[index] {
//                result[index] = to+1
//                break
//            }
//            to -= 1
//        }
//    }
//    return result
//}



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

//solution1122(3)

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



//11 / 24 멀쩡한 사각형 프로그래머스 2단계

//가로 길이가 Wcm, 세로 길이가 Hcm인 직사각형 종이가 있습니다. 종이에는 가로, 세로 방향과 평행하게 격자 형태로 선이 그어져 있으며, 모든 격자칸은 1cm x 1cm 크기입니다. 이 종이를 격자 선을 따라 1cm × 1cm의 정사각형으로 잘라 사용할 예정이었는데, 누군가가 이 종이를 대각선 꼭지점 2개를 잇는 방향으로 잘라 놓았습니다. 그러므로 현재 직사각형 종이는 크기가 같은 직각삼각형 2개로 나누어진 상태입니다. 새로운 종이를 구할 수 없는 상태이기 때문에, 이 종이에서 원래 종이의 가로, 세로 방향과 평행하게 1cm × 1cm로 잘라 사용할 수 있는 만큼만 사용하기로 하였습니다.
//가로의 길이 W와 세로의 길이 H가 주어질 때, 사용할 수 있는 정사각형의 개수를 구하는 solution 함수를 완성해 주세요.
//가로가 8, 세로가 12인 직사각형을 대각선 방향으로 자르면 총 16개 정사각형을 사용할 수 없게 됩니다. 원래 직사각형에서는 96개의 정사각형을 만들 수 있었으므로, 96 - 16 = 80 을 반환합니다.
func gcd(w:Int, h:Int) -> Int {
    var maxNumber = max(w, h)
    var minNumber = min(w,h)
    
    while maxNumber % minNumber != 0 {
        let temp = maxNumber % minNumber
        maxNumber = max(minNumber, temp)
        minNumber = min(minNumber, temp)
    }
    
    return minNumber
}


func solution1124(_ w:Int, _ h:Int) -> Int64{
    var answer:Int64 = 0
    let gcdNumber = gcd(w: w, h: h)
    let totalCount = w * h
    let widthProportion = w / gcdNumber
    let heightProportion = h / gcdNumber
    var subtractCount = widthProportion + heightProportion - 1
   
    answer = Int64(totalCount - (subtractCount * gcdNumber))
    return answer
}

solution1124(8, 12)


//func gcd(_ a:Int, _ b:Int) -> Int64{
//    if a == 0 { return Int64(b) }
//    return gcd(b%a,a)
//}
