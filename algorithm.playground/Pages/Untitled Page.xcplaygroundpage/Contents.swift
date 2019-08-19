import Foundation


func solution(_ priorities:[Int], _ location:Int) -> Int {
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

solution([2,3,9,1,1,1], 0)
