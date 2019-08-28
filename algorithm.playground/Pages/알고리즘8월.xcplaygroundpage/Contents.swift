
import Foundation
//프로그래머스 팀에서는 기능 개선 작업을 수행 중입니다. 각 기능은 진도가 100%일 때 서비스에 반영할 수 있습니다.
//
//또, 각 기능의 개발속도는 모두 다르기 때문에 뒤에 있는 기능이 앞에 있는 기능보다 먼저 개발될 수 있고, 이때 뒤에 있는 기능은 앞에 있는 기능이 배포될 때 함께 배포됩니다.
//
//먼저 배포되어야 하는 순서대로 작업의 진도가 적힌 정수 배열 progresses와 각 작업의 개발 속도가 적힌 정수 배열 speeds가 주어질 때 각 배포마다 몇 개의 기능이 배포되는지를 return 하도록 solution 함수를 완성하세요.
//
//제한 사항
//작업의 개수(progresses, speeds배열의 길이)는 100개 이하입니다.
//작업 진도는 100 미만의 자연수입니다.
//작업 속도는 100 이하의 자연수입니다.
//배포는 하루에 한 번만 할 수 있으며, 하루의 끝에 이루어진다고 가정합니다. 예를 들어 진도율이 95%인 작업의 개발 속도가 하루에 4%라면 배포는 2일 뒤에 이루어집니다.
//입출력 예
//progresses    speeds    return
//    [93,30,55]    [1,30,5]    [2,1]
//입출력 예 설명
//첫 번째 기능은 93% 완료되어 있고 하루에 1%씩 작업이 가능하므로 7일간 작업 후 배포가 가능합니다.
//두 번째 기능은 30%가 완료되어 있고 하루에 30%씩 작업이 가능하므로 3일간 작업 후 배포가 가능합니다. 하지만 이전 첫 번째 기능이 아직 완성된 상태가 아니기 때문에 첫 번째 기능이 배포되는 7일째 배포됩니다.
//세 번째 기능은 55%가 완료되어 있고 하루에 5%씩 작업이 가능하므로 9일간 작업 후 배포가 가능합니다.
//
//따라서 7일째에 2개의 기능, 9일째에 1개의 기능이 배포됩니다.


//93은 1의 속도로 증가하네? 100이 아니면 계속 반복,

//8월 17일
func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var progressesTemp = progresses
    var temp: [Int] = []
    var result: [Int] = []
    var resultCount = 0

    func add() -> [Int] {
        for x in 0...progressesTemp.count-1 {
            progressesTemp[x] = progressesTemp[x]+speeds[x]
        }
        return progressesTemp
    }
   
    for x in 0...progressesTemp.count-1 {
        var tempCount = 0
        while progressesTemp[x] < 100 {
            tempCount += 1
            add()
        }
        temp.append(tempCount)
    }
    
    
    for (offset,element) in temp.enumerated() {
        if resultCount != 0 && element > 0 {
            result.append(resultCount)
            resultCount = 1
        } else if resultCount == 0 && element > 0 || element == 0 {
            resultCount += 1
        }
        if offset == (temp.count-1) {
            result.append(resultCount)
        }
    }

    
    return result
}


//solution([93,30,55], [1,30,5])
//첫번째가 리턴되는 경우? 첫번째 두번째......?


// 8월 18(일)

//문제 설명
//일반적인 프린터는 인쇄 요청이 들어온 순서대로 인쇄합니다. 그렇기 때문에 중요한 문서가 나중에 인쇄될 수 있습니다. 이런 문제를 보완하기 위해 중요도가 높은 문서를 먼저 인쇄하는 프린터를 개발했습니다. 이 새롭게 개발한 프린터는 아래와 같은 방식으로 인쇄 작업을 수행합니다.
//
//1. 인쇄 대기목록의 가장 앞에 있는 문서(J)를 대기목록에서 꺼냅니다.
//2. 나머지 인쇄 대기목록에서 J보다 중요도가 높은 문서가 한 개라도 존재하면 J를 대기목록의 가장 마지막에 넣습니다.
//3. 그렇지 않으면 J를 인쇄합니다.
//예를 들어, 4개의 문서(A, B, C, D)가 순서대로 인쇄 대기목록에 있고 중요도가 2 1 3 2 라면 C D A B 순으로 인쇄하게 됩니다.
//
//내가 인쇄를 요청한 문서가 몇 번째로 인쇄되는지 알고 싶습니다. 위의 예에서 C는 1번째로, A는 3번째로 인쇄됩니다.
//
//현재 대기목록에 있는 문서의 중요도가 순서대로 담긴 배열 priorities와 내가 인쇄를 요청한 문서가 현재 대기목록의 어떤 위치에 있는지를 알려주는 location이 매개변수로 주어질 때, 내가 인쇄를 요청한 문서가 몇 번째로 인쇄되는지 return 하도록 solution 함수를 작성해주세요.
//
//제한사항
//현재 대기목록에는 1개 이상 100개 이하의 문서가 있습니다.
//인쇄 작업의 중요도는 1~9로 표현하며 숫자가 클수록 중요하다는 뜻입니다.
//location은 0 이상 (현재 대기목록에 있는 작업 수 - 1) 이하의 값을 가지며 대기목록의 가장 앞에 있으면 0, 두 번째에 있으면 1로 표현합니다.
//입출력 예
//priorities    location    return
//    [2, 1, 3, 2]    2    1
//[1, 1, 9, 1, 1, 1]    0    5
//입출력 예 설명
//예제 #1
//
//문제에 나온 예와 같습니다.
//
//예제 #2
//
//6개의 문서(A, B, C, D, E, F)가 인쇄 대기목록에 있고 중요도가 1 1 9 1 1 1 이므로 C D E F A B 순으로 인쇄합니다.


func sol0819(_ priorities:[Int], _ location:Int) -> Int {
    var sort = priorities
    var tempSort = priorities
    var locationAndElement: [(Int,Int)] = []
    var count = 0
    var maxTemp = 0
    for (offset,element) in priorities.enumerated() {
        locationAndElement.append((offset,element))
    }
    
    tempSort.sort(by: >)
    
    func sorting(index:Int) -> [Int] {
       maxTemp = 0
       var tuple = (0,0)
        for x in sort[index...sort.count-1] {
            if x > maxTemp {
                maxTemp = x
            }
        }
        if sort[index] == maxTemp {
            return sort
        } else {
            let temp = sort[index]
            sort.remove(at: index)
            sort.append(temp)
            tuple = locationAndElement[index]
            locationAndElement.remove(at: index)
            locationAndElement.append(tuple)
            return sort
        }
    }
    
    for _ in 0...sort.count-1 {
        print("sort1 :",sort)
        while sort != sorting(index: 0) {
            print("sort2 :",sort)
        }
    
        if maxTemp == sort[0] {
             count += 1
            if locationAndElement[0].0 == location {
                return count
            }
            sort.remove(at: 0)
            locationAndElement.remove(at: 0)
            
        }
    }
    return count
}
//sol0819([1,1,9,1,1,1], 3)


// 1: 1 9 1 1 -> 1 9 1 1 1: -> 9 1 1 1: 1 -> 1 1 1: 1

//[3,4,2,1] -> [4,2,1,3] ->



// 정답지?
func helpSolution0819(_ priorities:[Int], _ location:Int) -> Int {
    var queue: [(Int,Int)] = []
    var priorityQueoue: [Int] = []
    
    for x in 0..<priorities.count {
        let priority = priorities[x]
        queue.append((priority,x))
        priorityQueoue.append(priority)
    }
    
    priorityQueoue.sort(by: >)
    var count = 0
    while !queue.isEmpty {
        let topPriority = priorityQueoue.first
        print("first queue :",queue)
        print("first priority :",priorityQueoue)
        print("topPriority :",topPriority)
        guard let doc = queue.first else {
            break
        }
        queue.removeFirst()
        
        if topPriority == doc.0 {
            print("doc1 :",doc.0,doc.1)
            count += 1
            priorityQueoue.removeFirst()
            print("second queue :",queue)
            print("second priority :",priorityQueoue)
            print("second topPriority :",topPriority)
            if doc.1 == location {
                print("third queue :",queue)
                print("third priority :",priorityQueoue)
                print("third topPriority :",topPriority)
                break
            }
        } else {
            queue.append(doc)
            print("queue :",queue)
        }
        
        
    }
    return count
}

//helpSolution0819([2,3,9,1,1,1], 0)

func otherSolution0819(_ priorities:[Int], _ location:Int) -> Int {
    var cPriorities = priorities
    var targetIndex = location
    var seq = 0
    
    while cPriorities.count > 0 {
        if cPriorities.contains(where: { $0 > cPriorities[0] }) {
            let first = cPriorities.removeFirst()
            cPriorities.append(first)
            targetIndex = targetIndex - 1 < 0 ? cPriorities.count - 1 : targetIndex - 1
        } else {
            if(targetIndex == 0) {
                return priorities.count - cPriorities.count + 1
            }
            
            cPriorities.removeFirst()
            targetIndex = targetIndex - 1
        }
    }
    
    return 0
}


// 8월 20일
//0 또는 양의 정수가 주어졌을 때, 정수를 이어 붙여 만들 수 있는 가장 큰 수를 알아내 주세요.
//
//예를 들어, 주어진 정수가 [6, 10, 2]라면 [6102, 6210, 1062, 1026, 2610, 2106]를 만들 수 있고, 이중 가장 큰 수는 6210입니다.
//
//0 또는 양의 정수가 담긴 배열 numbers가 매개변수로 주어질 때, 순서를 재배치하여 만들 수 있는 가장 큰 수를 문자열로 바꾸어 return 하도록 solution 함수를 작성해주세요.
var h = ["13","61","81"]
var count = 3
h.max()

h.shuffled()
h
func factorial(number:Int) -> Int {
    var result = 1
    for x in 1...number {
        result *= x
    }
    return result
}

var c = [30,90,3]
c.sorted {
    print("left :","\($0)\($1)","right :","\($1)\($0)")
   return Int("\($0)\($1)")! > Int("\($1)\($0)")!
}


// 답지보고..해결.. 힌트는 솔트에서 옆에있는수를 합친걸 크기비교.. 덧셈이아니라 합치는것.. 스트링으로 합치고 인트로 크기비교 ㅠㅠ 처음 스트링으로 바꾼후 크기순으로 정렬해봤는데.. 30 과 3에서 30이 3 보다 더 큰걸로 나와서... 오류.. 303이 330보다 작음.. ㅠㅠ
func solution0820(_ numbers:[Int]) -> String {
    var temp = ""
    let sortedNumbers = numbers
        .sorted {
        Int("\($0)\($1)")! > Int("\($1)\($0)")!
        }
    sortedNumbers.forEach { (num) in
        temp += "\(num)"
        }
    return temp.first == "0" ? "0" : temp
}

solution0820([0,0,0])




//func solution(_ numbers: [Int]) -> String {
//    let sortedNumbers = numbers.sorted {
//        Int("\($0)\($1)")! > Int("\($1)\($0)")!
//    }
//
//    let answer = sortedNumbers.map { String($0) }.reduce("") { $0 + $1 }
//    return sortedNumbers.first == 0 ? "0" : answer
//}
