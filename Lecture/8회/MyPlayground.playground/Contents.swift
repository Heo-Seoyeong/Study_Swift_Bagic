/* 인스턴스 생성과 소멸 */

// 이니셜라이저와 디이니셜라이저
// init, deinit

//MARK: - 프로퍼티 기본값
// 스위프트의 모든 인스턴스는 초기화와 동시에
// 모든 프로퍼티에 유효한 값이 할당되어 있어야 합니다
// 프로퍼티에 미리 기본값을 할당해두면
// 인스턴스가 생성됨과 동시에 초기값을 지니게 됩니다
class PersonA {
    // 모든 저장 프로퍼티에 기본값 할당
    var name: String = "unknown"
    var age: Int = 0
    var nickName: String = "nick"
}

let heo: PersonA = PersonA()
heo.name = "heo"
heo.age = 30
heo.nickName = "j"

//MARK: - 이니셜라이저
// 프로퍼티 기본값을 지정하기 어려운 경우에는
// 이니셜라이저를 통해
// 인스턴스가 가져야 할 초기값을 전달할 수 있습니다
class PersonB {
    var name: String
    var age: Int
    var nickName: String
    
    // 이니셜라이저
    init(name: String, age: Int, nickName: String) {
        self.name = name
        self.age = age
        self.nickName = nickName
    }
}

let dung: PersonB = PersonB(name: "dung", age: 20, nickName: "하나")

//let dung: PersonB = PersonB(name: "dung", age: 20, nickName: "")

//MARK: 프로퍼티의 초기값이 꼭 필요 없을 때
// 옵셔널을 사용!
class PersonC {
    var name: String
    var age: Int
    var nickName: String?
    
    init(name: String, age: Int, nickName: String) {
        self.name = name
        self.age = age
        self.nickName = nickName
    }
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

let jenny: PersonC = PersonC(name: "jenny", age: 10)
let mike: PersonC = PersonC(name: "mike", age: 15, nickName: "m")

// 암시적 추출 옵셔널은
// 인스턴스 사용에 꼭 필요하지만
// 초기값을 할당하지 않고자 할 때 사용
class Puppy {
    var name: String
    var owner: PersonC!
    
    init(name: String) {
        self.name = name
    }
    
    func goOut() {
        print("\(name)가 주인 \(owner.name)와 산책을 합니다")
    }
}

let happy: Puppy = Puppy(name: "happy")
// 강아지는 주인없이 산책하면 안돼요!
//happy.goOut() // 주인이 없는 상태라 오류 발생
happy.owner = jenny
happy.goOut()
// happy가 주인 jenny와 산책을 합니다

//MARK: 실패가능한 이니셜라이저
// 이니셜라이저 매개변수로 전달되는 초기값이 잘못된 경우
// 인스턴스 생성에 실패할 수 있습니다
// 인스턴스 생성에 실패하면 nil을 반환합니다
// 그래서 실패가능한 이니셜라이저의 반환타입은 옵셔널 타입입니다
class PersonD {
    var name: String
    var age: Int
    var nickName: String?
    
    init?(name: String, age: Int) {
        if (0...120).contains(age) == false {
            return nil
        }
        
        if name.characters.count == 0 {
            return nil
        }
        
        self.name = name
        self.age = age
    }
}

//let john: PersonD = PersonD(name: "john", age: 23)
let john: PersonD? = PersonD(name: "john", age: 23)
let joker: PersonD? = PersonD(name: "joker", age: 123)
let batman: PersonD? = PersonD(name: "", age: 10)

print(joker) // nil
print(batman) // nil
//MARK: - 디이니셜라이저
// deinit은 클래스의 인스턴스가
// 메모리에서 해제되는 시점에 호출됩니다
// 인스턴스가 해제되는 시점에 해야할 일을 구현할 수 있습니다
class PersonE {
    var name: String
    var pet: Puppy?
    var child: PersonC
    
    init(name: String, child: PersonC) {
        self.name = name
        self.child = child
    }
    
    deinit {
        if let petName = pet?.name {
            print("\(name)가 \(child.name)에게 \(petName)를 인도합니다")
            self.pet?.owner = child
        }
    }
}

var donald: PersonE? = PersonE(name: "donald", child: jenny)
donald?.pet = happy
donald = nil // donald 인스턴스가 더이상 필요없으므로 메모리에서 해제됩니다
// donald가 jenny에게 happy를 인도합니다



/* 옵셔널 체이닝 */

// 옵셔널 체이닝은 옵셔널 요소 내부의 프로퍼티로
// 또다시 옵셔널이 연속적으로 연결되는 경우 유용하게 사용할 수 있습니다

//MARK: - 옵셔널 체이닝
//MARK: 예제 클래스 및 인스턴스 생성
class Person {
    var name: String
    var job: String?
    var home: Apartment?
    
    init(name: String) {
        self.name = name
    }
}

class Apartment {
    var buildingNumber: String
    var roomNumber: String
    var `guard`: Person?
    var owner: Person?
    
    init(dong: String, ho: String) {
        buildingNumber = dong
        roomNumber = ho
    }
}

let seoyeong: Person? = Person(name: "seoyeong")
let apart: Apartment? = Apartment(dong: "101", ho: "202")
let superman: Person? = Person(name: "superman")


// 옵셔널 체이닝이 실행 후 결과값이 nil일 수 있으므로
// 결과 타입도 옵셔널입니다
// 만약 우리집의 경비원의 직업이 궁금하다면..?
// 옵셔널 체이닝을 사용하지 않는다면...
func guardJob(owner: Person?) {
    if let owner = owner {
        if let home = owner.home {
            if let `guard` = home.guard {
                if let guardJob = `guard`.job {
                    print("우리집 경비원의 직업은 \(guardJob)입니다")
                } else {
                    print("우리집 경비원은 직업이 없어요")
                }
            }
        }
    }
}

guardJob(owner: seoyeong)

//MARK: 옵셔널 체이닝 사용
// 옵셔널 체이닝을 사용한다면
func guardJobWithOptionalChaining(owner: Person?) {
    if let guardJob = owner?.home?.guard?.job {
        print("우리집 경비원의 직업은 \(guardJob)입니다")
    } else {
        print("우리집 경비원은 직업이 없어요")
    }
}

guardJobWithOptionalChaining(owner: seoyeong)
// 우리집 경비원은 직업이 없어요


seoyeong?.home?.guard?.job // nil
seoyeong?.home = apart

seoyeong?.home // Optional(Apartment) - apart instance
seoyeong?.home?.guard // nil
seoyeong?.home?.guard = superman

seoyeong?.home?.guard // Optional(Person) - superman instance
seoyeong?.home?.guard?.name // Optional(String) - "superman"
seoyeong?.home?.guard?.job // nil
seoyeong?.home?.guard?.job = "경비원"



//MARK: - nil 병합 연산자
var guardJob: String = ""

guardJob = seoyeong?.home?.guard?.job ?? "슈퍼맨"
print(guardJob) // 경비원
seoyeong?.home?.guard?.job = nil

guardJob = seoyeong?.home?.guard?.job ?? "슈퍼맨"
print(guardJob) // 슈퍼맨



/* 타입캐스팅 */

// 스위프트의 타입캐스팅은
// 인스턴스의 타입을 확인하는 용도
// 또는 클래스의 인스턴스를
// 부모 혹은 자식 클래스의 타입으로 사용할 수 있는지
// 확인하는 용도로 사용합니다
// is, as를 사용합니다

// 타입 캐스팅을 위한 클래스 정의
class Person2 {
    var name: String = ""
    func breath() {
        print("숨을 쉽니다")
    }
}

class Student: Person2 {
    var school: String = ""
    func goToSchool() {
        print("등교를 합니다")
    }
}

class UniversityStudent: Student {
    var major: String = ""
    func goToMT() {
        print("멤버쉽 트레이닝을 갑니다 신남!")
    }
}

var seoyeong2: Person2 = Person2()
var dung2: Student = Student()
var heo2: UniversityStudent = UniversityStudent()


//MARK: - 타입 확인
// is를 사용하여 타입을 확인합니다
var result: Bool = false

result = seoyeong2 is Person2 // true
result = seoyeong2 is Student // false
result = seoyeong2 is UniversityStudent // false
result = dung2 is Person2 // true
result = dung2 is Student // true
result = dung2 is UniversityStudent // false
result = heo2 is Person2 // true
result = heo2 is Student // true
result = heo2 is UniversityStudent // true
if seoyeong2 is UniversityStudent {
    print("seoyeong2은 대학생입니다")
} else if seoyeong2 is Student {
    print("seoyeong2은 학생입니다")
} else if seoyeong2 is Person {
    print("seoyeong2은 사람입니다")
} // seoyeong2은 사람입니다
switch heo2 {
case is Person2:
    print("heo2은 사람입니다")
case is Student:
    print("heo2은 학생입니다")
case is UniversityStudent:
    print("heo2은 대학생입니다")
default:
    print("heo2은 사람도, 학생도, 대학생도 아닙니다")
} // heo2은 사람입니다
switch heo2 {
case is UniversityStudent:
    print("heo2은 대학생입니다")
case is Student:
    print("heo2은 학생입니다")
case is Person2:
    print("heo2은 사람입니다")
default:
    print("heo2은 사람도, 학생도, 대학생도 아닙니다")
} // heo2은 대학생입니다
//MARK: - 업 캐스팅
// as를 사용하여 부모클래스의 인스턴스로 사용할 수 있도록
// 컴파일러에게 타입정보를 전환해줍니다
// Any 혹은 AnyObject로도 타입정보를 변환할 수 있습니다
// 암시적으로 처리되므로 생략해도 무방합니다
var mike2: Person2 = UniversityStudent() as Person2
var jenny2: Student = Student()
//var jina: UniversityStudent = Person() as UniversityStudent // 컴파일 오류
var jina: Any = Person2() // as Any 생략가능

//MARK: - 다운 캐스팅
// as? 또는 as!를 사용하여
// 자식 클래스의 인스턴스로 사용할 수 있도록
// 컴파일러에게 인스턴스의 타입정보를 전환해줍니다
//MARK: 조건부 다운 캐스팅
// as?
var optionalCasted: Student?

optionalCasted = mike2 as? UniversityStudent
optionalCasted = jenny2 as? UniversityStudent // nil
optionalCasted = jina as? UniversityStudent // nil
optionalCasted = jina as? Student // nil

//MARK: 강제 다운 캐스팅
// as!
var forcedCasted: Student = Student()

optionalCasted = mike2 as! UniversityStudent
//optionalCasted = jenny2 as! UniversityStudent // 런타임 오류
//optionalCasted = jina as! UniversityStudent // 런타임 오류
//optionalCasted = jina as! Student // 런타임 오류

// 활용
func doSomethingWithSwitch(someone: Person2) {
    switch someone {
    case is UniversityStudent:
        (someone as! UniversityStudent).goToMT()
    case is Student:
        (someone as! Student).goToSchool()
    case is Person2:
        (someone as! Person2).breath()
    }
}

doSomethingWithSwitch(someone: mike2 as Person2) // 멤버쉽 트레이닝을 갑니다 신남!
doSomethingWithSwitch(someone: mike2) // 멤버쉽 트레이닝을 갑니다 신남!
doSomethingWithSwitch(someone: jenny2) // 등교를 합니다
doSomethingWithSwitch(someone: seoyeong2) // 숨을 쉽니다

func doSomething(someone: Person2) {
    if let universityStudent = someone as? UniversityStudent {
        universityStudent.goToMT()
    } else if let student = someone as? Student {
        student.goToSchool()
    } else if let person = someone as? Person2 {
        person.breath()
    }
}

doSomething(someone: mike2 as Person2) // 멤버쉽 트레이닝을 갑니다 신남!
doSomething(someone: mike2) // 멤버쉽 트레이닝을 갑니다 신남!
doSomething(someone: jenny2) // 등교를 합니다
doSomething(someone: seoyeong2) // 숨을 쉽니다
