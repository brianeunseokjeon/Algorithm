
import Foundation


func filterAndSort(input: String, fromArray: [String]) -> [String] {
    
    let lowerCasedArray = fromArray.map { $0.lowercased() }
    
    let filteredArray = lowerCasedArray.filter { $0.hasPrefix(input) }
    
    guard !filteredArray.isEmpty else { return [] }
    
    var countedArray = [(count: Int, word: String)]()
    
    filteredArray.forEach { (word) in
        if !countedArray.contains(where: { return word == $0.word }) {
            let wordCount = filteredArray.filter { $0 == word }.count
            countedArray.append((wordCount, word))
        }
    }
    
    return countedArray.sorted { $0.count >= $1.count }.map { $0.word }
}

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
    guard numberOfCoinsToFlip > 0 else { return nil }
    
    guard numberOfCoinsToFlip != 1 else {
        return array.filter { $0 == "T" }.count
    }
    
    // check if it's all H
    guard array.contains("T") else { return 0 }
    
    let inputCount = input.count
    
    // chekc if the input string is shorter than the number of coins to flip
    if inputCount == numberOfCoinsToFlip {
        guard input == createString(withSubstring: "T", number: numberOfCoinsToFlip) else { return nil }
        return 1
    } else if inputCount < numberOfCoinsToFlip {
        return nil
    } else {
        var result = Set<Int>()
        
        for firstIndex in 0...(array.count - numberOfCoinsToFlip) {
            var temp = array.flip(fromIndex: firstIndex,
                                  toIndex: firstIndex+numberOfCoinsToFlip-1)
            var count = 1
            
            while temp.firstIndex(of: "T") != nil {
                guard let tIndex = temp.firstIndex(of: "T") else { return firstIndex+1 }
                
                guard (array.count - tIndex) >= numberOfCoinsToFlip else { return nil }
                temp = temp.flip(fromIndex: tIndex, toIndex: tIndex+numberOfCoinsToFlip-1)
                count += 1
            }
            
            result.insert(count)
        }
        guard let minValue = result.min() else { return nil }
        return minValue
    }
    return nil
}

checkIfCoinsCanBeFlipedToFaceHead(input: "TTTHTHHT", numberOfCoinsToFlip: 3)
checkIfCoinsCanBeFlipedToFaceHead(input: "HHHH", numberOfCoinsToFlip: 4)
checkIfCoinsCanBeFlipedToFaceHead(input: "HHTTTHH", numberOfCoinsToFlip: 3)
checkIfCoinsCanBeFlipedToFaceHead(input: "THTHT", numberOfCoinsToFlip: 4)
checkIfCoinsCanBeFlipedToFaceHead(input: "THTHT", numberOfCoinsToFlip: 0)
checkIfCoinsCanBeFlipedToFaceHead(input: "HTTHHHT", numberOfCoinsToFlip: 2)
checkIfCoinsCanBeFlipedToFaceHead(input: "HTTHHHT", numberOfCoinsToFlip: 3)
checkIfCoinsCanBeFlipedToFaceHead(input: "HTTHHHT", numberOfCoinsToFlip: 4)
checkIfCoinsCanBeFlipedToFaceHead(input: "HTTHHHT", numberOfCoinsToFlip: 5)


//filterAndSort(input: "wa", fromArray: ["wadizian", "wadiz", "wadiz", "reward", "equity"])


