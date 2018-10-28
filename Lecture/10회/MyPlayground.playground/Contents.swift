
/* 오류처리 */

//MARK: - 오류표현
//Error 프로토콜과 (주로) 열거형을 통해서 오류를 표현합니다
/*
 enum <#오류종류이름#>: Error {
 case <#종류1#>
 case <#종류2#>
 case <#종류3#>
 //...
 }
 */


// 자판기 동작 오류의 종류를 표현한 VendingMachineError 열거형
enum VendingMachineError: Error {
    case invalidInput
    case insufficientFunds(moneyNeeded: Int)
    case outOfStock
}

//MARK:- 함수에서 발생한 오류 던지기
// 자판기 동작 도중 발생한 오류 던지기
// 오류 발생의 여지가 있는 메서드는 throws를 사용하여
// 오류를 내포하는 함수임을 표시합니다
class VendingMachine {
    let itemPrice: Int = 100
    var itemCount: Int = 5
    var deposited: Int = 0
    
    // 돈 받기 메서드
    func receiveMoney(_ money: Int) throws {
        
        // 입력한 돈이 0이하면 오류를 던집니다
        guard money > 0 else {
            throw VendingMachineError.invalidInput
        }
        
        // 오류가 없으면 정상처리를 합니다
        self.deposited += money
        print("\(money)원 받음")
    }
    
    // 물건 팔기 메서드
    func vend(numberOfItems numberOfItemsToVend: Int) throws -> String {
        
        // 원하는 아이템의 수량이 잘못 입력되었으면 오류를 던집니다
        guard numberOfItemsToVend > 0 else {
            throw VendingMachineError.invalidInput
        }
        
        // 구매하려는 수량보다 미리 넣어둔 돈이 적으면 오류를 던집니다
        guard numberOfItemsToVend * itemPrice <= deposited else {
            let moneyNeeded: Int
            moneyNeeded = numberOfItemsToVend * itemPrice - deposited
            
            throw VendingMachineError.insufficientFunds(moneyNeeded: moneyNeeded)
        }
        
        // 구매하려는 수량보다 요구하는 수량이 많으면 오류를 던집니다
        guard itemCount >= numberOfItemsToVend else {
            throw VendingMachineError.outOfStock
        }
        
        // 오류가 없으면 정상처리를 합니다
        let totalPrice = numberOfItemsToVend * itemPrice
        
        self.deposited -= totalPrice
        self.itemCount -= numberOfItemsToVend
        
        return "\(numberOfItemsToVend)개 제공함"
    }
}

// 자판기 인스턴스
let machine: VendingMachine = VendingMachine()

// 판매 결과를 전달받을 변수
var result: String?


//MARK:- 오류처리
//오류발생의 여지가 있는 throws 함수(메서드)는
//try를 사용하여 호출해야합니다
//try, try?, try!

//MARK: do-catch
//오류발생의 여지가 있는 throws 함수(메서드)는
//do-catch 구문을 활용하여
//오류발생에 대비합니다
// 가장 정석적인 방법으로 모든 오류 케이스에 대응합니다
do {
    try machine.receiveMoney(0)
} catch VendingMachineError.invalidInput {
    print("입력이 잘못되었습니다")
} catch VendingMachineError.insufficientFunds(let moneyNeeded) {
    print("\(moneyNeeded)원이 부족합니다")
} catch VendingMachineError.outOfStock {
    print("수량이 부족합니다")
} // 입력이 잘못되었습니다

// 하나의 catch 블럭에서 switch 구문을 사용하여
// 오류를 분류해봅니다
// 굳이 위의 것과 크게 다를 것이 없습니다
do {
    try machine.receiveMoney(300)
} catch /*(let error)*/ {
    
    switch error {
    case VendingMachineError.invalidInput:
        print("입력이 잘못되었습니다")
    case VendingMachineError.insufficientFunds(let moneyNeeded):
        print("\(moneyNeeded)원이 부족합니다")
    case VendingMachineError.outOfStock:
        print("수량이 부족합니다")
    default:
        print("알수없는 오류 \(error)")
    }
} // 300원 받음

// 딱히 케이스별로 오류처리 할 필요가 없으면
// catch 구문 내부를 간략화해도 무방합니다
do {
    result = try machine.vend(numberOfItems: 4)
} catch {
    print(error)
} // insufficientFunds(100)
// 딱히 케이스별로 오류처리 할 필요가 없으면 do 구문만 써도 무방합니다
do {
    result = try machine.vend(numberOfItems: 4)
}


//MARK: try? 와 try!
//try?
//별도의 오류처리 결과를 통보받지 않고
//오류가 발생했으면 결과값을 nil로 돌려받을 수 있습니다
//정상동작 후에는 옵셔널 타입으로 정상 반환값을 돌려 받습니다
result = try? machine.vend(numberOfItems: 2)
result // Optional("2개 제공함")
result = try? machine.vend(numberOfItems: 2)
result // nil
//try!
//오류가 발생하지 않을 것이라는 강력한 확신을 가질 때
//try!를 사용하면 정상동작 후에 바로 결과값을 돌려받습니다
//오류가 발생하면 런타임 오류가 발생하여
//애플리케이션 동작이 중지됩니다
result = try! machine.vend(numberOfItems: 1)
result // 1개 제공함
//result = try! machine.vend(numberOfItems: 1)
// 런타임 오류 발생!



/* 고차함수 */

//전달인자로 함수를 전달받거나
//함수실행의 결과를 함수로 반환하는 함수
//스위프트 표준라이브러리에서 제공하는
//유용한 고차함수에 대해 알아봅니다
//map, filter, reduce
//컨테이너 타입(Array, Set, Dictionary 등)에 구현되어 있습니다
//MARK:- map
//컨테이너 내부의 기존 데이터를 변형(transform)하여 새로운 컨테이너 생성
let numbers: [Int] = [0, 1, 2, 3, 4]
var doubledNumbers: [Int]
var strings: [String]

// for 구문 사용
doubledNumbers = [Int]()
strings = [String]()

for number in numbers {
    doubledNumbers.append(number * 2)
    strings.append("\(number)")
}

print(doubledNumbers) // [0, 2, 4, 6, 8]
print(strings) // ["0", "1", "2", "3", "4"]
// map 메서드 사용
// numbers의 각 요소를 2배하여 새로운 배열 반환
doubledNumbers = numbers.map({ (number: Int) -> Int in
    return number * 2
})

// numbers의 각 요소를 문자열로 변환하여 새로운 배열 반환
strings = numbers.map({ (number: Int) -> String in
    return "\(number)"
})

print(doubledNumbers) // [0, 2, 4, 6, 8]
print(strings) // ["0", "1", "2", "3", "4"]
// 매개변수, 반환 타입, 반환 키워드(return) 생략, 후행 클로저
doubledNumbers = numbers.map { $0 * 2 }
print(doubledNumbers) // [0, 2, 4, 6, 8]

//MARK:- filter
//컨테이너 내부의 값을 걸러서 새로운 컨테이너로 추출
// for 구문 사용
// 변수 사용에 주목하세요
var filtered: [Int] = [Int]()

for number in numbers {
    if number % 2 == 0 {
        filtered.append(number)
    }
}

print(filtered) // [0, 2, 4]
// filter 메서드 사용
// numbers의 요소 중 짝수를 걸러내어 새로운 배열로 반환
let evenNumbers: [Int] = numbers.filter { (number: Int) -> Bool in
    return number % 2 == 0
}
print(evenNumbers) // [0, 2, 4]
// 매개변수, 반환 타입, 반환 키워드(return) 생략, 후행 클로저
let oddNumbers: [Int] = numbers.filter {
    $0 % 2 != 0
}
print(oddNumbers) // [1, 3]


//MARK:- reduce
// 컨테이너 내부의 콘텐츠를 하나로 통합
let someNumbers: [Int] = [2, 8, 15]

// for 구문 사용
// 변수 사용에 주목하세요
var result: Int = 0

// someNumbers의 모든 요소를 더합니다
for number in someNumbers {
    result += number
}

print(result) // 25

// reduce 메서드 사용
// 초깃값이 0이고 someNumbers 내부의 모든 값을 더합니다.
let sum: Int = someNumbers.reduce(0, { (first: Int, second: Int) -> Int in
    //print("\(first) + \(second)") //어떻게 동작하는지 확인해보세요
    return first + second
})

print(sum)  // 25
// 초깃값이 0이고 someNumbers 내부의 모든 값을 뺍니다.
var subtract: Int = someNumbers.reduce(0, { (first: Int, second: Int) -> Int in
    //print("\(first) - \(second)") //어떻게 동작하는지 확인해보세요
    return first - second
})

print(subtract) // -25
// 초깃값이 3이고 someNumbers 내부의 모든 값을 더합니다.
let sumFromThree = someNumbers.reduce(3) { $0 + $1 }

print(sumFromThree) // 28
