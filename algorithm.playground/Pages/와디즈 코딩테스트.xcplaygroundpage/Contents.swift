
import Foundation



var h = [1,2,3,4]




func filterAndSort(input: String, fromArray: [String]) -> [String] {
    
    let lowerCasedArray = fromArray.map { $0.lowercased() }
    
    let filteredArray = lowerCasedArray.filter { $0.hasPrefix(input) }
    
    guard !filteredArray.isEmpty else { return [] }
    
    var countedArray = [(count: Int, word: String)]()
    
    filteredArray.forEach { (word) in
        print(word)
        if !countedArray.contains(where: { return word == $0.word }) {
            let wordCount = filteredArray.filter { $0 == word }.count
            countedArray.append((wordCount, word))
        }
    }
    
    return countedArray.sorted { $0.count >= $1.count }.map { $0.word }
}
filterAndSort(input: "wa", fromArray: ["wadizian", "wadiz", "wadiz", "reward", "equity"])




extension Character {
    func flip() -> Character {
        if self == "T" {
            return "H"
        } else if self == "H" {
            return "T"
        } else {
            fatalError()
        }
    }
}

extension Array where Element == Character {
    func flip(fromIndex: Int, toIndex: Int) -> [Element] {
        var result = [Element]()
        
        for i in 0..<count {
            if fromIndex <= i && i <= toIndex {
                result.append(self[i].flip())
            } else {
                result.append(self[i])
            }
        }
        return result
    }
}

func createString(withSubstring: Substring, number: Int) -> String {
    var result = ""
    for _ in 0..<number {
        result += withSubstring
    }
    return result
}

func checkIfCoinsCanBeFlipedToFaceHead(input: String, numberOfCoinsToFlip: Int) -> Int? {
    /// Condition: flip coinds to make coin face HEAD
    let array = Array(input)
    //첫번째 만약 음수가 한번에 넘기는 코인수가 0 이나 음수면 nil
    guard numberOfCoinsToFlip > 0 else { return nil }
    
    //두번째, 한번에 넘기는 코인수가 1이라면 array 에 T 갯수만큼 리턴
    guard numberOfCoinsToFlip != 1 else {
        return array.filter { $0 == "T" }.count
    }
    
    // 세번째,T 자체가 포함안되어있으면 넘길 필요없이 0
    guard array.contains("T") else { return 0 }
    
    let inputCount = input.count
    
    // 한번에 넘기는 코인수가 input 의 갯수보다 같거나 크거나 작을때.. 나눠서 생각
    
    // 네번째, 한번에 넘기는 코인수가 input 의 갯수와 같을때 모두 T 로구성됬다면 리턴 1
    if inputCount == numberOfCoinsToFlip {
        guard input == createString(withSubstring: "T", number: numberOfCoinsToFlip) else { return nil }
        return 1
        //다섯번째, 한번에 넘기는 코인수가 input의 갯수보다 클때! nil
    } else if inputCount < numberOfCoinsToFlip {
        return nil
        
        // 여섯번째, 한번에 넘기는 코인수가 input 갯수보다 작을때, 이제 시작이다.
    } else {
        var result = Set<Int>()
        
//        for firstIndex in 0...(array.count - numberOfCoinsToFlip) {
//            var temp = array.flip(fromIndex: firstIndex,
//                                  toIndex: firstIndex+numberOfCoinsToFlip-1)
        var temp = array
        var count = 0
            while temp.firstIndex(of: "T") != nil {
                // 첫번째로 T가 있는 인덱스를 찾자.
                guard let tIndex = temp.firstIndex(of: "T") else { return nil }
                // 만약에 첫번째로 있는 인덱스의 위치에서 한번에 넘겨야할 코인수를 감당하지 못하면 게임 오버.
                guard (array.count - tIndex) >= numberOfCoinsToFlip else { return nil }
                
                temp = temp.flip(fromIndex: tIndex, toIndex: tIndex+numberOfCoinsToFlip-1)
                count += 1
            }
            
            result.insert(count)
//        }
        print("result :",result)
        guard let minValue = result.min() else { return nil }
        return minValue
    }
}
//H 로 만들기. 뒤에 숫자가 한번 넘어가는데 같이 넘어가는 숫자.

checkIfCoinsCanBeFlipedToFaceHead(input: "TTTHTHHT", numberOfCoinsToFlip: 3)
checkIfCoinsCanBeFlipedToFaceHead(input: "HHHH", numberOfCoinsToFlip: 4)
checkIfCoinsCanBeFlipedToFaceHead(input: "HHTTTHH", numberOfCoinsToFlip: 3)
checkIfCoinsCanBeFlipedToFaceHead(input: "THTHT", numberOfCoinsToFlip: 4)
checkIfCoinsCanBeFlipedToFaceHead(input: "THTHT", numberOfCoinsToFlip: 0)
checkIfCoinsCanBeFlipedToFaceHead(input: "HTTHHHT", numberOfCoinsToFlip: 2)
checkIfCoinsCanBeFlipedToFaceHead(input: "HTTHHHT", numberOfCoinsToFlip: 3)
checkIfCoinsCanBeFlipedToFaceHead(input: "HTTHHHT", numberOfCoinsToFlip: 4)
checkIfCoinsCanBeFlipedToFaceHead(input: "HTTHHHT", numberOfCoinsToFlip: 5)




