//: [Previous](@previous)

import Foundation

// 6월 19일 수요일
//An array A consisting of N different integers is given. The array contains integers in the range [1..(N + 1)], which means that exactly one element is missing.
//
//Your goal is to find that missing element.
//
//Write a function:
//
//class Solution { public int solution(int[] A); }
//
//that, given an array A, returns the value of the missing element.
//
//For example, given array A such that:
//
//A[0] = 2
//A[1] = 3
//A[2] = 1
//A[3] = 5
//the function should return 4, as it is the missing element.
//
//Write an efficient algorithm for the following assumptions:
//
//N is an integer within the range [0..100,000];
//the elements of A are all distinct;
//each element of array A is an integer within the range [1..(N + 1)].

public func solution(_ A : inout [Int]) -> Int {
    var tempArr = A.sorted()
    for x in tempArr.enumerated(){
        guard x.offset + 2 != x.element else {return x.offset+1}
    }
    return A.count+1
    
}









func solution(_ bridge:Int, _ weight:Int, _ trucks:[Int]) -> Int {
    var arriveArr:[Int] = []
    var ingArr:[Int] = []
    for _ in 1...bridge {
        ingArr.append(0)
    }
    var count = 0
    var temp = 0
    for x in trucks {
        count += 1
        
        if count % (bridge+1) == 0 {
            ingArr[bridge-1]
        } else {
            
        }
        
    }
    return count
}



solution(3, 5, [7,4,7])


// 100100001

func algo(num:Int) -> Int {
    var count = 0
    var firstCount = 0
    for x in "\(num)" {
        
        if x == "1" {
            if firstCount >= count {
                count = 0
            } else {
                firstCount = count
            }
        }else {
            count += 1
        }
    }
    return firstCount
}

//7월 2일 화요일 알고리즘 스킬트리 -> 못해서 7월 3일 수요일에도 함.
//스킬은 알파벳 대문자로 표기하며, 모든 문자열은 알파벳 대문자로만 이루어져 있습니다.
//스킬 순서와 스킬트리는 문자열로 표기합니다.
//예를 들어, C → B → D 라면 CBD로 표기합니다
//선행 스킬 순서 skill의 길이는 2 이상 26 이하이며, 스킬은 중복해 주어지지 않습니다.
//skill_trees는 길이 1 이상 20 이하인 배열입니다.
//skill_trees의 원소는 스킬을 나타내는 문자열입니다.
//skill_trees의 원소는 길이가 2 이상 26 이하인 문자열이며, 스킬이 중복해 주어지지 않습니다.
//입출력 예

//입출력 예 설명
//BACDE: B 스킬을 배우기 전에 C 스킬을 먼저 배워야 합니다. 불가능한 스킬트립니다.
//CBADF: 가능한 스킬트리입니다.
//AECB: 가능한 스킬트리입니다.
//BDA: B 스킬을 배우기 전에 C 스킬을 먼저 배워야 합니다. 불가능한 스킬트리입니다.

// 시도 는 스킬을 먼저 배열에 담는다. 스킬에 있는 첫번째 문자가 일단 스킬트리에 잇는 첫번째 원소가 몇번째에 가지고 있는지 체크.
// 두번째 스킬배열에 있는 문자가 스킬트리에 잇는 첫번째 원소의 몇번째에 가지고 있는지 체크 해서 첫번째 와 두번째 숫자 카운트 체크해서 두번째가 더 크지않으면 break 다음 스킬트리배열의 원소를 사용.
func solution709(_ skill:String, _ skill_trees:[String]) -> Int {
    var answer = 0
    var skillArray :[Character:Int] = [:]
    var temp :[Int] = []
    var count = 0
    
    for x in skill.enumerated() {
        if !(skillArray[x.element] != nil) {
            skillArray[x.element] = x.offset
        }
    }
    for x in skill_trees {
        temp = []
        count = 0
        
        for y in x {
            if (skillArray[y] != nil) {
                temp.append(skillArray[y] ?? 100)
            }
        }
        if temp.isEmpty {
            answer += 1
        } else {
            for z in temp.enumerated() {
                if z.offset != z.element {
                    count += 1
                }
            }
            if count == 0 {
                answer += 1
            }
        }
    }
    
    return answer
}


// 실패하다가... 7월 9일에 성공함
//func solution701(_ skill:String, _ skill_trees:[String]) -> Int {
//    var skillArray :[Character] = []
//    var answer = 0
//    var tempCount = 0
//    var count = 0
//    var anotherCount = 0
//    var no = 0
//
//
//    for x in skill {
//        skillArray.append(x)
//    }
//
//
//    for x in skill_trees {
//        no = 0
//        count = 0
//        tempCount = 0
//        anotherCount = 0
//
//
//        for k in skillArray/* SBAKL */ {
//            count = 0
//            for y in x /* SBERTL */ {
//                count += 1
//                if k == y {
//                    if count > tempCount {
//                tempCount = count
//                        no = 1
//                    break
//                    } else {
//                        print("오류 :",x)
//                        no = 10
//                        break
//                    }
//                }
//            }
//            if no == 10 {
//                break
//            }
//            print(k,"여기에 뭔가 걸려야 되는데",x,"그냥 count:",count,"tempCount :",tempCount)
//            if skillArray[0] == k && count == x.count && no != 1{
//                print("오류2 :" ,x)
//                no = 10
//                break
//            }
////            print(k,"여기서","tempCount :",tempCount,"count :",count)
//        }
//
//        print("no :",no, "x :", x)
//        if no == 1 {
//            print("dfdfdfdfdfdfdfsfdazdfaefa",x)
//            answer += 1
//        }
//
//        for j in skillArray {
//            if !x.contains(j) {
//                anotherCount += 1
//            }
//        }
//        if anotherCount == skillArray.count {
//            print("여긴누가 들어가니? :",x)
//            answer += 1
//        }
//    }
//
//    return answer
//}



solution709("CBD", ["BACDE", "CBADF", "AECB", "BDA"])
solution709("CB", ["ADE","CERK"])
solution709("SBAKL", ["SEBRLT"])


// 다른사람 풀이!!
func solution7091(_ skill:String, _ skill_trees:[String]) -> Int {
    
    func available(_ s: String, _ t: String) -> Bool {
        let alza = t.filter { s.contains($0) }
        return s.starts(with: alza)
    }
    
    return skill_trees.map { available(skill, $0) }.filter { $0 }.count
}

solution7091("CBD", ["BACDE", "CBADF", "AECB", "BDA"])
solution7091("CB", ["ADE","CERK"])
solution7091("SBAKL", ["SEBRLT"])






/*
 [문제 설명]
 땅따먹기 게임을 하려고 합니다. 땅따먹기 게임의 땅(land)은 총 N행 4열로 이루어져 있고, 모든 칸에는 점수가 쓰여 있습니다. 1행부터 땅을 밟으며 한 행씩 내려올 때, 각 행의 4칸 중 한 칸만 밟으면서 내려와야 합니다. 단, 땅따먹기 게임에는 한 행씩 내려올 때, 같은 열을 연속해서 밟을 수 없는 특수 규칙이 있습니다.
 
 예를 들면,
 
 | 1 | 2 | 3 | 5 |
 
 | 5 | 6 | 7 | 8 |
 
 | 4 | 3 | 2 | 1 |
 
 로 땅이 주어졌다면, 1행에서 네번째 칸 (5)를 밟았으면, 2행의 네번째 칸 (8)은 밟을 수 없습니다.
 
 마지막 행까지 모두 내려왔을 때, 얻을 수 있는 점수의 최대값을 return하는 solution 함수를 완성해 주세요. 위 예의 경우, 1행의 네번째 칸 (5), 2행의 세번째 칸 (7), 3행의 첫번째 칸 (4) 땅을 밟아 16점이 최고점이 되므로 16을 return 하면 됩니다.
 
 [제한사항]
 
 행의 개수 N : 100,000 이하의 자연수
 열의 개수는 4개이고, 땅(land)은 2차원 배열로 주어집니다.
 점수 : 100 이하의 자연수
 [입출력 예]
 
 land    answer
 [[1,2,3,5],[5,6,7,8],[4,3,2,1]]
 
 */

func a(num:Int) -> Int {
    if num == 0 {
        return 0
    } else if num == 1 {
         return 1
    } else {
        return a(num: num-1) + a(num: num-2)
    }
    
}
let b =  [[4,3,2,1],[8,5,3,1]]




func rank(_ arr:[Int],rank:Int) -> (Int,Int) {
    var ranker = 0
    var index = 0
    var tempArr :[Int] = []
    
    tempArr = arr.sorted(by: >)
    ranker = tempArr[rank-1]
    
    for (ind,element) in arr.enumerated() {
        if element == ranker {
            index = ind
        }
    }
    
    
    return (ranker,index)
}

rank([1,9,8,3], rank: 4).0 // ranker
rank([1,9,8,3], rank: 4).1 // ranker 의 index


func solution723(_ land:[[Int]]) -> Int{
    var answer = 0
    var first = 0
    var second = 0
    var firstIndex = 0
    var secondIndex = 0
    
    for arr in land {
        for (x,y) in arr.enumerated() {
            if y > first {
                
            }
        }
        first = rank(arr, rank: 1).0
        firstIndex = rank(arr, rank: 1).1
        second = rank(arr, rank: 2).0
        secondIndex = rank(arr, rank: 2).1
        
        
        
    }

    return answer
}



solution723([[1,5,3,2],[5,6,7,8],[4,3,2,1]])
let a = [[1,6,7,5],[4,6,7,8],[4,6,2,11]]


//func solution723(_ land:[[Int]]) -> Int{
//    var answer = 0
//    var dp = land
//    if land.count == 1 {
//       answer = max(dp[0][0], dp[0][1], dp[0][2], dp[0][3])
//    } else {
//    for i in (0...dp.count - 2) {
//    dp[i+1][0] = max(land[i+1][1],land[i+1][2],land[i+1][3])+dp[i][0]
//    dp[i+1][1] = max(land[i+1][0],land[i+1][2],land[i+1][3])+dp[i][1]
//    dp[i+1][2] = max(land[i+1][1],land[i+1][0],land[i+1][3])+dp[i][2]
//    dp[i+1][3] = max(land[i+1][1],land[i+1][2],land[i+1][0])+dp[i][3]
//        print(dp[i+1][0],dp[i+1][1],dp[i+1][2],dp[i+1][3])
//    }
//    answer = max(dp[dp.count-1][0], dp[dp.count-1][1], dp[dp.count-1][2], dp[dp.count-1][3])
//    }
//    return answer
//}
//: [Next](@next


