/* 콘솔로그와 문자열 보간법 */

let age: Int = 26

"안녕하세요! 저는 \(age)살입니다."
// == "안녀하세요! 저는 10살입니다"

print("안녕하세요! 저는 \(age + 5)살입니다.")

print("\n####################")

class Person {
    var name: String = "Seoyeong"
    var age: Int = 26
}

let seoyeong: Person = Person()

print(seoyeong)

print("\n####################")

// 인스턴스의 내용을 자세하게 알려준다
dump(seoyeong)



/* 변수와 상수 */

// 상수, 변수의 선언
// 상수 선언 키워드 let
// 변수 선언 키워드 var

// 상수의 선언
// let 이름: 타입 = 값

// 변수의 선언
// var 이름: 타입 = 값

// 값의 타입이 명확하다면 타입은 생략 가능
// 하지만 특별한 경우 외엔 적어준다
// let 이름 = 값
// var 이름 = 값

let constant: String = "차후에 변경이 불가능한 상수 let"
var variable: String = "차후에 변경이 가능한 변수 var"

variable = "변수는 이렇게 차후에 다른 값을 할당할 수 있지만"
// constatnt = "상수는 차후에 값을 변경할 수 없습니다." // 오류발생

// 상수 선언 후에 나중에 값 할당하기

// 나중에 할당하려고 하는 상수나 변수는 타입을 꼭 명시
let sum: Int
let inputA: Int = 100
let inputB: Int = 200

// 선언 후 첫 할당
sum = inputA + inputB

var nickName: String
nickName = "Seoyeong"
// 초기화후에 호출해야한다 초기화전에 호출을 하면 빈값이어서 에러가 발생

// 변수는 차후에 다시 다른 값을 할당해도 문제가 없다.

