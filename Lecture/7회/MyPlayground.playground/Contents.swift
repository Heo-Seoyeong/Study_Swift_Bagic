/* 프로퍼티 */
 
struct Student {
    
    // 인스턴스 저장 프로퍼티
    var name: String = ""
    var `class`: String = "Swift"
    var koreanAge: Int = 0
    
    // 인스턴스 연산 프로퍼티
    var westernAge: Int {
        get {
            return koreanAge - 1
        }
        
        set(inputValue) {
            koreanAge = inputValue + 1
        }
    }
    
    // 타입 저장 프로퍼티
    static var typeDescription: String = "학생"
    
    /*
     // 인스턴스 메서드
     func selfIntroduce() {
     print("저는 \(self.class)반 \(name)입니다")
     }
     */
    
    // 읽기전용 인스턴스 연산 프로퍼티
    // 간단히 위의 selfIntroduce() 메서드를 대체할 수 있습니다
    var selfIntroduction: String {
        get {
            return "저는 \(self.class)반 \(name)입니다"
        }
    }
    
    /*
     // 타입 메서드
     static func selfIntroduce() {
     print("학생타입입니다")
     }
     */
    
    // 읽기전용 타입 연산 프로퍼티
    // 읽기전용에서는 get을 생략할 수 있습니다
    static var selfIntroduction: String {
        return "학생타입입니다"
    }
}

// 타입 연산 프로퍼티 사용
print(Student.selfIntroduction)
// 학생타입입니다

// 인스턴스 생성
var seoyeong: Student = Student()
seoyeong.koreanAge = 26

// 인스턴스 저장 프로퍼티 사용
seoyeong.name = "seoyeong"
print(seoyeong.name)
// seoyeong

// 인스턴스 연산 프로퍼티 사용
print(seoyeong.selfIntroduction)
// 저는 Swift반 seoyeong입니다

print("제 한국나이는 \(seoyeong.koreanAge)살이고, 미쿡나이는 \(seoyeong.westernAge)살입니다.")
// 제 한국나이는 26살이고, 미쿡나이는 25살입니다.

struct Money {
    var currencyRate: Double = 1100
    var dollar: Double = 0
    var won: Double {
        get {
            return dollar * currencyRate
        }
        set {
            dollar = newValue / currencyRate
        }
    }
}

var moneyInMyPocket = Money()

moneyInMyPocket.won = 11000

print(moneyInMyPocket.won)
// 11000.0

moneyInMyPocket.dollar = 10

print(moneyInMyPocket.won)
// 11000.0

//var a: Int = 100
//var b: Int = 200
//var sum: Int {
//    return a + b
//}
//
//print(sum) // 300



/* 프로퍼티 감시자 */

struct Money2 {
    // 프로퍼티 감시자 사용
    var currencyRate: Double = 1100 {
        willSet(newRate) {
            print("환율이 \(currencyRate)에서 \(newRate)으로 변경될 예정입니다")
        }
        
        didSet(oldRate) {
            print("환율이 \(oldRate)에서 \(currencyRate)으로 변경되었습니다")
        }
    }
    
    // 프로퍼티 감시자 사용
    var dollar: Double = 0 {
        // willSet의 암시적 매개변수 이름 newValue
        willSet {
            print("\(dollar)달러에서 \(newValue)달러로 변경될 예정입니다")
        }
        
        // didSet의 암시적 매개변수 이름 oldValue
        didSet {
            print("\(oldValue)달러에서 \(dollar)달러로 변경되었습니다")
        }
    }
    
    // 연산 프로퍼티
    var won: Double {
        get {
            return dollar * currencyRate
        }
        set {
            dollar = newValue / currencyRate
        }
        
        /* 프로퍼티 감시자와 연산 프로퍼티 기능을 동시에 사용할 수 없습니다
         willSet {
         
         }
         */
    }
}

var moneyInMyPocket2: Money2 = Money2()

// 환율이 1100.0에서 1150.0으로 변경될 예정입니다
moneyInMyPocket2.currencyRate = 1150
// 환율이 1100.0에서 1150.0으로 변경되었습니다

// 0.0달러에서 10.0달러로 변경될 예정입니다
moneyInMyPocket2.dollar = 10
// 0.0달러에서 10.0달러로 변경되었습니다

print(moneyInMyPocket2.won)
// 11500.0



/* 상속 */

// 스위프트의 상속은 클래스, 프로토콜 등에서 가능합니다
// 열거형, 구조체는 상속이 불가능합니다
// 스위프트는 다중상속을 지원하지 않습니다
// 이번 파트에서는 클래스의 상속에 대해서 알아봅니다
import Swift

//MARK: - 클래스의 상속과 재정의
//class <#이름#>: <#상속받을 클래스 이름#> {
//    /* <#구현부#> */
//}
class Person2 {
    var name: String = ""
    
    func selfIntroduce() {
        print("저는 \(name)입니다")
    }
    
    // final 키워드를 사용하여 재정의를 방지할 수 있습니다
    final func sayHello() {
        print("hello")
    }
    
    // 타입 메서드
    // 재정의 불가 타입 메서드 - static
    static func typeMethod() {
        print("type method - static")
    }
    
    // 재정의 가능 타입 메서드 - class
    class func classMethod() {
        print("type method - class")
    }
    
    // 재정의 가능한 class 메서드라도
    // final 키워드를 사용하면 재정의 할 수 없습니다
    // 메서드 앞의 `static`과 `final class`는 똑같은 역할을 합니다
    final class func finalClassMethod() {
        print("type method - final class")
    }
}

class Student2: Person2 {
    var major: String = ""
    
    override func selfIntroduce() {
        print("저는 \(name)이고, 전공은 \(major)입니다")
    }
    
    override class func classMethod() {
        print("overriden type method - class")
    }
    
    // static을 사용한 타입 메서드는 재정의 할 수 없습니다
    //    override static func typeMethod() {    }
    
    // final 키워드를 사용한 메서드, 프로퍼티는 재정의 할 수 없습니다
    //    override func sayHello() {    }
    //    override class func finalClassMethod() {    }
}

let seoyeong2: Person2 = Person2()
let dung2: Student2 = Student2()

seoyeong2.name = "seoyeong"
dung2.name = "dung"
dung2.major = "Swift"

seoyeong2.selfIntroduce()
// 저는 seoyeong입니다
dung2.selfIntroduce()
// 저는 dung이고, 전공은 Swift입니다
Person2.classMethod()
// type method - class
Person2.typeMethod()
// type method - static
Person2.finalClassMethod()
// type method - final class

Student2.classMethod()
// overriden type method - class
Student2.typeMethod()
// type method - static
Student2.finalClassMethod()
// type method - final class
