import UIKit

//알고리즘 1회차 6월 6일
/*
 문자열로 구성된 리스트 strings와, 정수 n이 주어졌을 때, 각 문자열의 인덱스 n번째 글자를 기준으로 오름차순 정렬하려 합니다. 예를 들어 strings가 [sun, bed, car]이고 n이 1이면 각 단어의 인덱스 1의 문자 u, e, a로 strings를 정렬합니다.
 
 제한 조건
 strings는 길이 1 이상, 50이하인 배열입니다.
 strings의 원소는 소문자 알파벳으로 이루어져 있습니다.
 strings의 원소는 길이 1 이상, 100이하인 문자열입니다.
 모든 strings의 원소의 길이는 n보다 큽니다.
 인덱스 1의 문자가 같은 문자열이 여럿 일 경우, 사전순으로 앞선 문자열이 앞쪽에 위치합니다.
 입출력 예
 strings             n        return
 [sun, bed, car]     1    [car, bed, sun]
 [abce, abcd, cdx]   2    [abcd, abce, cdx]
 */








func solution6(_ strings:[String], _ n:Int) -> [String] {
    
    let index = String.Index(encodedOffset: n)
    return strings.sorted {($0[index],$0)<($1[index],$1)}
}

print(solution6( ["abce", "abcd", "cdxx","mdke","akse"],3 ))


func solution61(_ strings:[String], _ n:Int) -> [String] {
    return strings.sorted(by: {
        let index = $0.index($0.startIndex, offsetBy: n)
//        let index1 = $1.index($1.startIndex, offsetBy: n)
        switch $0[index] {
        case $1[index]:
            return $0 < $1
        default:
            return $0[index] < $1[index]
        }
    })
}

print(solution61(["abce", "abcd", "cdxx","mdke","akse","qeie","dueoq","Qwewe","sxue","owhrg"], 1))



//공부내용

//dropLast 마지막에서 2개 버린다.

let numbers = [1, 2, 3, 4, 5]
print(numbers.dropLast(2))
// Prints "[1, 2, 3]"
print(numbers.dropLast(10))
// Prints "[]"

//dropFirst 처음부터 2개 삭제.
print(numbers.dropFirst(2))
// Prints "[3, 4, 5]"

//prefix 앞에서부터 2개
print(numbers.prefix(2))
// Prints "[1, 2]"
numbers
print(numbers.split(separator: 2))


let students = ["Kofi", "Abena", "Peter", "Kweku","Ard", "Akosua"]
if let i = students.firstIndex(where: { $0.hasPrefix("A")
}) {
    print("\(students[i]) starts with 'A'!")
    
}
// Prints "Abena starts with 'A'!"


let numbers2 = [3, 7, 4, -2, 9, -6, 10, 1]
if let lastNegative = numbers2.last(where: { $0 < 0 }) {
    print("The last negative number is \(lastNegative).")
}
// Prints "The last negative number is -6."


//알고리즘 2회차 6월 7일

////나누어 떨어지는 숫자 배열
// 문제 설명
//array의 각 element 중 divisor로 나누어 떨어지는 값을 오름차순으로 정렬한 배열을 반환하는 함수, solution을 작성해주세요.
//divisor로 나누어 떨어지는 element가 하나도 없다면 배열에 -1을 담아 반환하세요.
//
//제한사항
//arr은 자연수를 담은 배열입니다.
//정수 i, j에 대해 i ≠ j 이면 arr[i] ≠ arr[j] 입니다.
//divisor는 자연수입니다.
//array는 길이 1 이상인 배열입니다.
//입출력 예
//arr            divisor      return
//[5, 9, 7, 10]    5         [5, 10]
//[2, 36, 1, 3]    1      [1, 2, 3, 36]
//[3,2,6]          10         [-1]


func solution7(_ arr:[Int], _ divisor:Int) -> [Int] {
    var save: [Int] = []
    for x in arr {
        if x % divisor == 0 {
            save.append(x)
        }
    }
    if save == [] {
        save.append(-1)
    }
    return save.sorted(by: <)
}
//추가 답
func solution71(_ arr:[Int], _ divisor:Int) -> [Int] {
    let array = arr.sorted().filter{ $0 % divisor == 0 }
    return  array == [] ? [-1] : array
}

//3회차 6월10일
// 자연수 n을 뒤집어 각 자리 숫자를 원소로 가지는 배열 형태로 리턴해주세요. 예를들어 n이 12345이면 [5,4,3,2,1]을 리턴합니다.
func solution10(_ n:Int64) -> [Int] {
    var num = Int(n)
    var arr = [Int]()
    while num > 0 {
        arr.append(num % 10)
        num /= 10
    }
    return arr
}

solution10(12345)


// compactMap 사용하면 배열을 리턴함.
func solution101(_ n:Int64) -> [Int] {
    return String(n).reversed().compactMap { Int(String($0)) }
}

solution101(123468)


//4회차 6월 13일 (목)
//문자열 s에 나타나는 문자를 큰것부터 작은 순으로 정렬해 새로운 문자열을 리턴하는 함수, solution을 완성해주세요.
//s는 영문 대소문자로만 구성되어 있으며, 대문자는 소문자보다 작은 것으로 간주합니다.
//
//제한 사항
//str은 길이 1 이상인 문자열입니다.
//입력          결과
//Zbcdefg    gfedcbZ



func sol13(_ s:String) -> String {
    var str = s
    return String(str.sorted(by: >))
}
sol13("ebxrdzneAXEZ")


//4회 - 2
//시저 암호
//문제 설명
//어떤 문장의 각 알파벳을 일정한 거리만큼 밀어서 다른 알파벳으로 바꾸는 암호화 방식을 시저 암호라고 합니다. 예를 들어 AB는 1만큼 밀면 BC가 되고, 3만큼 밀면 DE가 됩니다. z는 1만큼 밀면 a가 됩니다. 문자열 s와 거리 n을 입력받아 s를 n만큼 민 암호문을 만드는 함수, solution을 완성해 보세요.
//
//제한 조건
//공백은 아무리 밀어도 공백입니다.
//s는 알파벳 소문자, 대문자, 공백으로만 이루어져 있습니다.
//s의 길이는 8000이하입니다.
//n은 1 이상, 25이하인 자연수입니다.
//입출력 예
//s        n    result
//AB       1     BC
//z        1      a
//a B z    4    e F d


func solution13(_ s:String, _ n:Int) -> String {
   let lowerCase = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
    let upperCase = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    var strArr: [String] = []
    var str = ""
    for x in s {
        if lowerCase.contains("\(x)") {
            
           let num = lowerCase.firstIndex(of: "\(x)")! + n
            strArr.append(lowerCase[num%26])
        } else if upperCase.contains("\(x)") {
           let num = upperCase.firstIndex(of: "\(x)")! + n
            strArr.append(upperCase[num%26])
        } else {
            strArr.append(" ")
        }
    }
    for x in strArr {
       str += x
    }
    return str
}

solution13("a", 4)
let upperCase = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
for (index, value) in upperCase.enumerated() {
    
}

// 6월 14일 (금) 5회차

//문자열 s는 한 개 이상의 단어로 구성되어 있습니다. 각 단어는 하나 이상의 공백문자로 구분되어 있습니다. 각 단어의 짝수번째 알파벳은 대문자로, 홀수번째 알파벳은 소문자로 바꾼 문자열을 리턴하는 함수, solution을 완성하세요.
//
//제한 사항
//문자열 전체의 짝/홀수 인덱스가 아니라, 단어(공백을 기준)별로 짝/홀수 인덱스를 판단해야합니다.
//첫 번째 글자는 0번째 인덱스로 보아 짝수번째 알파벳으로 처리해야 합니다.

func solution14(_ s:String) -> String {
    var arr: [String] = []
    var str = ""
    var count = 0
    for x in s {
        count += 1
        if count % 2 == 1 {
            arr.append("\(x.uppercased())")
        } else {
            arr.append("\(x.lowercased())")
        }
    }
    for y in arr {
        str += y
    }
    return str
}
solution14("try hello world")
