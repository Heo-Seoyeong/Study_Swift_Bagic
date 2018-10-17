import UIKit

/* 함수 기본 */

// MARK: - 함수의 선언

// MARK: 함수선언의 기본형태 (매개변수는 파라미터라고도 한다)
//func 함수이름(매개변수1이름: 매개변후1타입, 매개변수2이름: 매개변수2타입 ...) -> 반환타임 {
//    함수 구현부
//    return 반환값
//}

func sum(a: Int, b: Int) -> Int {
    return a + b
}

// MARK: 반환값이 없는 함수
//func 함수이름(매개변수1이름: 매개변후1타입, 매개변수2이름: 매개변수2타입 ...) -> Void {
//    함수 구현부
//    return
//}

func printMyName(name: String) -> Void {
    print(name)
}

//func 함수이름(매개변수1이름: 매개변후1타입, 매개변수2이름: 매개변수2타입 ...) {
//    함수 구현부
//    return
//}

func printYourName(name: String) {
    print(name)
}

//MARK: 매개변수가 없는 함수
//func 함수이름() -> 반환타입 {
//    함수 구현부
//    return 반환값
//}

func maximumIntegerValue() -> Int {
    return Int.max
}

//MAKR: 매개변수와 반환값이 없는 함수
//func 함수이름() -> Void {
//    함수 구현부
//    return
//}

func hello() -> Void {
    print("Hello")
}

//func 함수이름() {
//    함수 구현부
//    return
//}

func bye() {
    print("bye")
}

//MARK: - 함수의 호출
sum(a: 3, b: 5)
printMyName(name: "Seoyeong")
printYourName(name: "HeoDung")
maximumIntegerValue()
hello()
bye()



/* 함수 고급 */

// MARK: - 매개변수 기본값

// 기본값을 갖는 매개변수는 매개변수 목록 중에 뒤쪽에 위치하는 것이 좋습니다.
//func 함수이름(매개변수1이름: 매개변수1타입, 매개변수2이름, 매개변수2타임 = 매개변수 기본값 ...) -> 반환타입 {
//    함수 구현부
//    return 반환값
//}

func greeting(friend: String, me: String = "Seoyeong") {
    print("Hello \(friend)! I'm \(me)")
}

// 매개변수 기본값을 가지는 매개변수는 생략 가능 (생략하면 기본값이 들어간다)
greeting(friend: "Heodung")
greeting(friend: "Seo", me: "Yeong")

// MARK: - 전달인자 레이블

// 전달인자 레이블은 함수를 호출할 때
// 매개변수의 역할을 좀 더 명확하게 하거나
// 함수 사용자의 입장에서 표현하고자 할 때 사용합니다
//func 함수이름(전달인자 레이블 매개변수1이름: 매개변수1타임, 전달인자 레이블 매개변수2이름: 매개변수2타입 ...) -> 반환타입 {
//    함수 구현부
//    return
//}

// 함수 내부에서 전달인자를 사용할 때에는 매개변수 이름을 사용합니다.
func greetiong(to friend: String, from me: String) {
    print("Hello \(friend)! I'm \(me)")
}

// 함수를 호출할 때에는 전달인자 레이블을 사용해야 합니다.
greeting(friend: "Seo", me: "Yeong")

//MARK: - 가변 매개변수

// 전달 받을 값의 개수를 알기 어려울 때 사용할 수 있습니다.
// 가변 매개변수는 함수당 하나만 가질 수 있습니다.
//func 함수이름(매개변수1이름: 매개변수1타임, 전달인자 레이블 매개변수2이름: 매개변수2타입...) -> 반환타입 {
//    함수 구현부
//    return
//}

func sayHelloToFriends(me: String, friends: String...) -> String {
    return "Hello \(friends)! I'm \(me)"
}

print(sayHelloToFriends(me: "Seoyeong", friends: "dung", "sey", "yeong"))
printYourName(name: sayHelloToFriends(me: "Seoyeong"))

//MARK: - 데이터 타입으로서의 함수

// 스위프트는 함수형 프로그래밍 패러다임을 포함하는 다중 패러다임 언어
// 스위프트의 함수는 일급객체이므로 변수, 상수 등에 저장이 가능하고
// 매개변수를 통해 전달할 수도 있습니다.

//MARK: - 함수의 타입표현
// 반환타입을 생략할 수 없습니다.
// (매개변수1타입, 매개변수2타입 ...) -> 반환타입

var someFunction: (String, String) -> Void = greetiong(to:from:)
someFunction("Dung", "Seoyeong")

someFunction = greeting(friend:me:)
someFunction("Dung", "Seoyeong")

// 타입이 다른 함수는 할당할 수 없습니다.
//someFunction = sayHelloToFriends(me: , friends: )

func runAnother(function: (String, String) -> Void) {
    function("Dung", "Seoyeong")
}

runAnother(function: greeting(friend:me:))
runAnother(function: someFunction)



/* 조건문 */

let someInteger = 100

// MARK: - if-else

//if <#condition#> {
//    statemets
//} else if <#condition#> {
//    statemets
//} else {
//    statemets
//}


if someInteger < 100 {
    print("100 미만")
} else if someInteger > 100 {
    print("100 초과")
} else {
    print("100")
}

// 스위프트의 조건에는 항상 Bool 타입이 들어와야합니다.
// someInteger는 Bool 타입이 아닌 Int 타입이기 때문에
// 비교문을 써주지 않으면 컴파일 오류가 발생

// MARK: - switch

//switch <#value#> {
//case <#pattern#>:
//    <#code#>
//default:
//    <#code#>
//}

switch someInteger {
case 0:
    print("zero")
case 1..<100:
    print("1~99")
case 100:
    print("100")
case 101...Int.max:
    print("over 100")
default:
    print("unknown")
}

// 정수 외의 대부분의 기본 타입을 사용할 수 있습니다.
switch "Seoyeong" {
case "jake":
    print("jake")
// break 가 자동으로 적용되나 break를 걸고 싶지않을땐 falthrough
    fallthrough
case "mina":
    print("jake")
case "yagom":
    print("jake")
default:
    print("unknown")
}
