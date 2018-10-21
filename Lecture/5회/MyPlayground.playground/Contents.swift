/* 구조체 */

//MARK: - 정의
//struct <#이름#> {
//    /* <#구현부#> */
//}
//MARK: 프로퍼티 및 메서드
struct Sample {
    // 가변 프로퍼티
    var mutableProperty: Int = 100
    
    // 불변 프로퍼티
    let immutableProperty: Int = 100
    
    // 타입 프로퍼티
    static var typeProperty: Int = 100
    
    // 인스턴스 메서드
    func instanceMethod() {
        print("instance method")
    }
    
    // 타입 메서드
    static func typeMethod() {
        print("type method")
    }
}

//MARK: 구조체 사용
// 가변 인스턴스
var mutable: Sample = Sample()

// 불변 프로퍼티는 인스턴스 생성 후 수정할 수 없습니다
// 컴파일 오류 발생
//mutable.immutableProperty = 200
// 불변 인스턴스
let immutable: Sample = Sample()

// 불변 인스턴스는 아무리 가변 프로퍼티라도
// 인스턴스 생성 후에 수정할 수 없습니다
// 컴파일 오류 발생
//immutable.immutableProperty = 200

// 타입 프로퍼티 및 메서드
Sample.typeProperty = 300
Sample.typeMethod() // type method
// 인스턴스에서는 타입 프로퍼티나 타입 메서드를
// 사용할 수 없습니다
// 컴파일 오류 발생
//mutable.typeProperty = 400
//mutable.typeMethod()

//MARK: - 학생 구조체
struct Student {
    // 가변 프로퍼티
    var name: String = "unknown"
    
    // 키워드도 `로 묶어주면 이름으로 사용할 수 있습니다
    var `class`: String = "Swift"
    
    // 타입 메서드
    static func selfIntroduce() {
        print("학생타입입니다")
    }
    
    // 인스턴스 메서드
    // self는 인스턴스 자신을 지칭하며, 몇몇 경우를 제외하고 사용은 선택사항입니다
    func selfIntroduce() {
        print("저는 \(self.class)반 \(name)입니다")
    }
}

// 타입 메서드 사용
Student.selfIntroduce() // 학생타입입니다
// 가변 인스턴스 생성
var seoyeong: Student = Student()
seoyeong.name = "seoyeong"
seoyeong.class = "스위프트"
seoyeong.selfIntroduce()   // 저는 스위프트반 seoyeong입니다
// 불변 인스턴스 생성
let dung: Student = Student()

// 불변 인스턴스이므로 프로퍼티 값 변경 불가
// 컴파일 오류 발생
//dung.name = "dung"
dung.selfIntroduce() // 저는 Swift반 unknown입니다


/* 클래스 */

//MARK: - 정의
//class <#이름#> {
//    /* <#구현부#> */
//}
//MARK: 프로퍼티 및 메서드
class SampleClass {
    // 가변 프로퍼티
    var mutableProperty: Int = 100
    
    // 불변 프로퍼티
    let immutableProperty: Int = 100
    
    // 타입 프로퍼티
    static var typeProperty: Int = 100
    
    // 인스턴스 메서드
    func instanceMethod() {
        print("instance method")
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
}


//MARK: 클래스 사용
// 인스턴스 생성 - 참조정보 수정 가능
var mutableReference: SampleClass = SampleClass()

mutableReference.mutableProperty = 200

// 불변 프로퍼티는 인스턴스 생성 후 수정할 수 없습니다
// 컴파일 오류 발생
//mutableReference.immutableProperty = 200

// 인스턴스 생성 - 참조정보 수정 불가
let immutableReference: SampleClass = SampleClass()

// 클래스의 인스턴스는 참조 타입이므로 let으로 선언되었더라도
// 인스턴스 프로퍼티의 값 변경이 가능합니다
immutableReference.mutableProperty = 200

// 다만 참조정보를 변경할 수는 없습니다
// 컴파일 오류 발생
//immutableReference = mutableReference
// 참조 타입이라도 불변 인스턴스는
// 인스턴스 생성 후에 수정할 수 없습니다
// 컴파일 오류 발생
//immutableReference.immutableProperty = 200

// 타입 프로퍼티 및 메서드
SampleClass.typeProperty = 300
SampleClass.typeMethod() // type method
// 인스턴스에서는 타입 프로퍼티나 타입 메서드를
// 사용할 수 없습니다
// 컴파일 오류 발생
//mutableReference.typeProperty = 400
//mutableReference.typeMethod()

//MARK: - 학생 클래스
class StudentClass {
    // 가변 프로퍼티
    var name: String = "unknown"
    
    // 키워드도 `로 묶어주면 이름으로 사용할 수 있습니다
    var `class`: String = "Swift"
    
    // 타입 메서드
    class func selfIntroduce() {
        print("학생타입입니다")
    }
    
    // 인스턴스 메서드
    // self는 인스턴스 자신을 지칭하며, 몇몇 경우를 제외하고 사용은 선택사항입니다
    func selfIntroduce() {
        print("저는 \(self.class)반 \(name)입니다")
    }
}

// 타입 메서드 사용
Student.selfIntroduce() // 학생타입입니다
// 인스턴스 생성
var seoyeong2: StudentClass = StudentClass()
seoyeong2.name = "seoyeong"
seoyeong2.class = "스위프트"
seoyeong2.selfIntroduce()   // 저는 스위프트반 seoyeong입니다
// 인스턴스 생성
let dung2: StudentClass = StudentClass()
dung2.name = "dung"
dung2.selfIntroduce() // 저는 Swift반 dung입니다



/* 열거형 */

//MARK: - 정의
//enum은 타입이므로 대문자 카멜케이스를 사용하여 이름을 정의합니다
//각 case는 소문자 카멜케이스로 정의합니다
//각 case는 그 자체가 고유의 값입니다
//enum <#이름#> {
//    case <#이름1#>
//    case <#이름2#>
//    case <#이름3#>, <#이름4#>, <#이름5#>
//    ...
//}
//MARK: 열거형 사용
enum Weekday {
    case mon
    case tue
    case wed
    case thu, fri, sat, sun
}

var day: Weekday = Weekday.mon
day = .tue

print(day) // tue
switch day {
case .mon, .tue, .wed, .thu:
    print("평일입니다")
case Weekday.fri:
    print("불금 파티!!")
case .sat, .sun:
    print("신나는 주말!!")
}
// 평일입니다

//MARK: - 원시값
//C 언어의 enum처럼 정수값을 가질 수도 있습니다
//rawValue를 사용하면 됩니다
//case별로 각각 다른 값을 가져야합니다
enum Fruit: Int {
    case apple = 0
    case grape = 1
    case peach
    //    case mango = 0
}

print("Fruit.peach.rawValue == \(Fruit.peach.rawValue)")
// Fruit.peach.rawValue == 2
//정수 타입 뿐만 아니라 Hashable 프로토콜을 따르는 모든 타입이 원시값의 타입으로 지정될 수 있습니다
enum School: String {
    case elementary = "초등"
    case middle = "중등"
    case high = "고등"
    case university
}

print("School.middle.rawValue == \(School.middle.rawValue)")
// School.middle.rawValue == 중등
print("School.university.rawValue == \(School.university.rawValue)")
// School.university.rawValue == university

//MARK: 원시값을 통한 초기화
//rawValue를 통해 초기화 할 수 있습니다
//rawValue가 case에 해당하지 않을 수 있으므로
//rawValue를 통해 초기화 한 인스턴스는 옵셔널 타입입니다
//let apple: Fruit = Fruit(rawValue: 0)
let apple: Fruit? = Fruit(rawValue: 0)

if let orange: Fruit = Fruit(rawValue: 5) {
    print("rawValue 5에 해당하는 케이스는 \(orange)입니다")
} else {
    print("rawValue 5에 해당하는 케이스가 없습니다")
} // rawValue 5에 해당하는 케이스가 없습니다


//MARK: 메서드
enum Month {
    case dec, jan, feb
    case mar, apr, may
    case jun, jul, aug
    case sep, oct, nov
    
    func printMessage() {
        switch self {
        case .mar, .apr, .may:
            print("따스한 봄~")
        case .jun, .jul, .aug:
            print("여름 더워요~")
        case .sep, .oct, .nov:
            print("가을은 독서의 계절!")
        case .dec, .jan, .feb:
            print("추운 겨울입니다")
        }
    }
}

Month.mar.printMessage()
// 따스한 봄~
