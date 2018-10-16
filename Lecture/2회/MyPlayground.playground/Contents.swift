import UIKit

// Swift의 기본 데이터 타입
// Bool, Int, UInt, Float, Double, Character, String

// Bool
var someBool: Bool = true
someBool = false

// Int
var someInt: Int = -100

// UInt : Unsigned Int
var someUInt: UInt = 100

// Fload : 부동 소수형 타입 32비트
var someFloat = 3.14
someFloat = 3

// Double : 부동 소후형 타입 64비트
var someDouble: Double = 3.14
someDouble = 3
// someDouble = someFloat

// Character
var someCharacter: Character = "가"
someCharacter = "A"
//someCharacter = "하하하"
print(someCharacter)

// String
var someString: String = "하하하 Seoyeong"
someString = someString + "웃으면 복이와요"



/*
 Any : Swift의 모든 타입을 지칭하는 키워드
 AnyObject : 모든 클래스 타입을 지칭하는 프로토콜
 nil : 없을을 의미하는 키워드
 */

// MARK: - Any
var someAny: Any = 100
someAny = "어떤 타입도 수용 가능합니다."
someAny = 123.12

// Any도 하나의 타입이다
//let someDouble: Double = someAny

// MARK: - AnyObject
class SomeClass{}
var someAnyObject: AnyObject = SomeClass()

//someAnyObject = 123.12

// MARK: - nil
// 어떤 값을 넣을 순 있지만 빈 값을 넣을 순 없다
//someAny = nil
//someAnyObject = nil



/* 컬렉션 타입 */
/*
 Array - 순서가 있는 리스트 컬렉션
 Dictionary - 키와 값이 쌍으로 이루어진 컬렉션
 Set - 순서가 없고, 멤버가 유일한 컬렉션 (중복이 없다)
 */

// MARK : - Array

// 빈 Int Array 생성
var integers: Array<Int> = Array<Int>()
integers.append(1)
integers.append(100)
//integers.append(101.1)

integers.contains(100)
integers.contains(99)

integers.remove(at: 0)
integers.removeLast()
integers.removeAll()

integers.count

//integers[0]

// Array<Double> 와 [Double]는 동일한 표현
// 빈 Double Array 생성
var doubles: Array<Double> = [Double]()

// 빈 String Array 생성
var strings: [String] = [String]()

// 빈 Character Array 생성
// []는 새로운 빈 Array
var characters: [Character] = []

// let을 사용하여 Array를 선언하면 불변 Array
let immutableArray = [1, 2, 3]

//immutableArray.append(4)
//immutableArray.removeAll()

// MARK: - Dictionary

// Key가 Srting 타입이고 Value가 Any인 빈 Dictionary 생성
var anyDictionary: Dictionary<String, Any> = [String: Any]()
anyDictionary["someKey"] = "value"
anyDictionary["anotherKey"] = 100
anyDictionary

anyDictionary["someKey"] = "dictionary"
anyDictionary

anyDictionary.removeValue(forKey: "anotherKey")

anyDictionary["someKey"] = nil
anyDictionary

let emptyDictionary: [String: String] = [:]
let initalizedDictionary: [String: String] = ["name": "seoyeong", "gender": "male"]

//emptyDictionary["key"] = "value"
//let someValue: String = initalizedDictionary["name"]

// MARK: - Set

// 빈 Int Set 생성
var integerSet: Set<Int> = Set<Int>()
integerSet.insert(1)
integerSet.insert(100)
integerSet.insert(99)
integerSet.insert(99)
integerSet.insert(99)

integerSet
integerSet.contains(1)
integerSet.contains(2)

integerSet.remove(100)
integerSet.removeFirst()

integerSet.count

let setA: Set<Int> = [1, 2, 3, 4, 5]
let setB: Set<Int> = [3, 4, 5, 6, 7]

let union: Set<Int> = setA.union(setB)

let sortedUnion: [Int] = union.sorted()

let intersection: Set<Int> = setA.intersection(setB)
let subtracting: Set<Int> = setA.subtracting(setB)
