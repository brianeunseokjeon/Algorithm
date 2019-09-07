import Foundation


//let h = "aabbaccc"
//let b = ["a", "a", "b", "b", "a", "c", "c", "c"]
//
//func cutString(s:String,num:Int) -> [String] {
//    let stringCount = s.count
//    let array = Array(s)
//    var tempString: [String] = []
//    var count = 1
//    tempString.append("\(array[0])")
//    for x in 1..<stringCount {
//        if x/num == count {
//            tempString.append("\(array[x])")
//            count += 1
//        } else {
//            tempString[x/num] += "\(array[x])"
//        }
//    }
//    return tempString
//}
//
//
//func same(array:[String]) -> [String] {
//    var currentIndex = 0
//
//    var temp: [String] = []
//    var count = 0
//
//    while array.count != currentIndex {
//        for x in currentIndex..<array.count {
//            if array[currentIndex] == array[x] {
//                count += 1
//                if currentIndex+count == array.endIndex {
//                    if count == 1 {
//                        temp.append(array[currentIndex])
//                    } else {
//                        temp.append("\(count)"+array[currentIndex])
//                    }
//                    currentIndex += count
//                    count = 0
//                    return temp
//                }
//            } else {
//                if count == 1 {
//                    temp.append(array[currentIndex])
//                } else {
//                    temp.append("\(count)"+array[currentIndex])
//                }
//                currentIndex += count
//                count = 0
//                break
//            }
//        }
//
//
//
//    }
//
//    return temp
//}


//func solution1(_ s:String) -> Int {
//    let stringCount = s.count
//    var tempInt: [Int] = []
//    guard stringCount > 1 else {return 1}
//
//    func cutString(s:String,num:Int) -> [String] {
//        let stringCount = s.count
//        let array = Array(s)
//        var tempString: [String] = []
//        var count = 1
//        tempString.append("\(array[0])")
//        for x in 1..<stringCount {
//            if x/num == count {
//                tempString.append("\(array[x])")
//                count += 1
//            } else {
//                tempString[x/num] += "\(array[x])"
//            }
//        }
//        return tempString
//    }
//    func same(array:[String]) -> [String] {
//        var currentIndex = 0
//
//        var temp: [String] = []
//        var count = 0
//
//        while array.count != currentIndex {
//            for x in currentIndex..<array.count {
//                if array[currentIndex] == array[x] {
//                    count += 1
//                    if currentIndex+count == array.endIndex {
//                        if count == 1 {
//                            temp.append(array[currentIndex])
//                        } else {
//                            temp.append("\(count)"+array[currentIndex])
//                        }
//                        currentIndex += count
//                        count = 0
//                        return temp
//                    }
//                } else {
//                    if count == 1 {
//                        temp.append(array[currentIndex])
//                    } else {
//                        temp.append("\(count)"+array[currentIndex])
//                    }
//                    currentIndex += count
//                    count = 0
//                    break
//                }
//            }
//        }
//        return temp
//    }
//
//
//    for x in 1...(stringCount/2) {
//       tempInt.append(same(array: cutString(s: s, num: x)).reduce(""){$0+$1}.count)
//        print(same(array: cutString(s: s, num: x)).reduce(""){$0+$1})
//    }
//
//    return tempInt.min() ?? 1
//}
//
//func prefixOrSuffix(input:String) -> String {
//    var tempString = ""
//    for x in input {
//        if x != "?" {
//            tempString += "\(x)"
//        }
//    }
//    return tempString
//}


//func solution(_ words:[String], _ queries:[String]) -> [Int] {
//    var matchCountArray: [Int] = []
//    for x in queries {
//        let sameCharactersCountArray = words.filter{$0.count == x.count}
//        if x.hasPrefix("?") {
//            let filteredArray = sameCharactersCountArray.filter { $0.hasSuffix(prefixOrSuffix(input: x)) }
//            matchCountArray.append(filteredArray.count)
//
//        } else {
//            let filteredArray = sameCharactersCountArray.filter { $0.hasPrefix(prefixOrSuffix(input: x)) }
//            matchCountArray.append(filteredArray.count)
//        }
//    }
//    return matchCountArray
//}

//let vc = [1,3,7,3 , 9].sorted()

func solution(_ n:Int, _ weak:[Int], _ dist:[Int]) -> Int {
    let maximumCycle = n/2
    var changeWeak = weak
    var minValue = 100
    var minWeak = weak // 최대 최소 사이간격 최소
    guard let fastest = dist.max() else {return -1}
    
    func makeCycleWeak(n:Int,input:[Int]) -> [Int] {
        var temp = input.sorted()
        let firstValue = temp[0]
        temp.remove(at: 0)
        temp.append(firstValue+n)
        return temp
    }
    

    for x in weak {
        if x < maximumCycle {
            let maxV = makeCycleWeak(n: n, input: changeWeak).max()!
            let minV = makeCycleWeak(n: n, input: changeWeak).min()!
            let dis = maxV - minV
            changeWeak = makeCycleWeak(n: n, input: changeWeak)

            if minValue > dis {
                minValue = dis
                minWeak = changeWeak
            }
        }
    }
    
    
    // 최소차이가 8보다 크면 끝
    if minWeak.count == 2 {
        if minValue > 8 || minValue > dist.max()!  {
            return -1
        }
    }
    
    if fastest >= minValue {
        return 1
    } else  {
        
    }
    
    return 2
    
}



solution(12, [1, 5, 6, 10] , [1, 2, 3, 4])
solution(12, [1, 3, 4, 9, 10] , [3, 5, 7])
solution(12, [3,7] , [1,3])



// partition 은 2개 이상부터...나눠..
func partition(minWeak:[Int],dist:[Int],num:Int) -> Int {
    var temp: [Int] = []
    var diffOfMinWeak: [Int] = []
    let des = dist.sorted{$0>$1}
    for x in 0..<num {
        temp.append(des[x])
    }

    for y in 0..<minWeak.count-1 {
       diffOfMinWeak.append(minWeak[y+1] - minWeak[y])
    }

    
    for _ in 0..<num-1 {

        let maxValue = diffOfMinWeak.max()!
        let maxIndex = diffOfMinWeak.firstIndex(of: maxValue)!
        diffOfMinWeak.remove(at: maxIndex)
    }
    print
    for x in 0..<num {
        if temp[x] < diffOfMinWeak[x] {
            return -1
        } else {
            return num
        }
    }
    return -1
}

partition(minWeak: [9,10,13,15,16], dist: [3,5], num: 2)
