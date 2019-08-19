//: [Previous](@previous)

import Foundation

//4곱하기 4 메이즈

func solution(s:String)->String {
    var stringArray: [Character] = []
    var resultString = ""
    for string in s {
        stringArray.append(string)
    }
    if stringArray.count % 2 == 0 {
        resultString += "\(stringArray[stringArray.count / 2])"
        resultString += "\(stringArray[stringArray.count / 2 + 1])"
    } else {
        resultString = "\(stringArray[stringArray.count / 2])"
    }
    return resultString
}

//solution(s: "abcde")

let h = "dagehbZ"
h.sorted(by: >)

func solution2(_ s:String) -> String {
    var lowerArr: [Character] = []
    var upperArr: [Character] = []
    var result = ""
    let upper = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    for word in s {
        if upper.contains("\(word)") {
            upperArr.append(word)
        } else {
            lowerArr.append(word)
        }
    }
    for character in lowerArr.sorted(by: >) {
        result += "\(character)"
    }
    for character in upperArr.sorted(by: >) {
        result += "\(character)"
    }
    
    return result
}



solution2("abewZef")

let a = [
    [1,1,0,0],
    [0,1,1,1],
    [1,0,1,0],
    [1,1,1,1]
]

// 미로 길찾기 문제..4*4

func maze(arr:[[Int]]) -> [[Int]] {
    var b = arr
    var count = 0
 
    for y in 0...3 {
        if y < 3 && b[0][y] == b[0][y+1] {
            
        } else if y == 3 && b[0][2] == b[0][3] {
            
        }
    }
    
   
    
    return b
}

//maze(arr: a)

