import UIKit

var nickname: String?

nickname = "고래밥"

// 1. 강제 해제 연산자
print(nickname!)

// 2. 조건문으로 nil 판단, 만일에 발생할 수 있는 런타임 오류 방지 가능
if nickname != nil {
    print("")
}

// 옵셔널 바인딩
if let name = nickname {
    print(name)
}


// swift 5.7 if let shorted
// 새로 나온 옵셔널 바인딩
if let nickname {
    print(nickname)
}

func tesOptionalBinding() {
    if let nickname {
        print("\(nickname)~~")
    }

    guard let nickname else {return} // nil일 때만 else 구문이 실행되기 때ㅜㅁㄴ에, 뒤에 함수 코드는 실행되지 않도록 return으로 함수를 종료시킴
    // early exit


    print(nickname)
}

tesOptionalBinding()


func searchWords() {

}




func randomWords() -> String? {
    let list = ["뉴진스", "아이유", "좋댓구알", "이생망"]

    return list.randomElement()
}

randomWords()


// 1. suffled
// 2. subtract
// 3. append


var number: Set = [1,2,3,4,5,6,7,8,9]

number.subtract([3])

print(number)

print(number.subtracting([4]))


//print(number.shuffled())


var nick = "ㅁㄴㅇㄹㅁㄹㅇ"
print(nick.appending("asdf"))
nick.append("a")

print(nick)


// ---------------------------------------------------------------------------------------------------

// 컴파일 시점에 enum case들을 확인할 수 있어, 오타나 휴먼에러 등을 방지할 수 있고 미리 오류 인지 가능

// 1. 미디어 종류 - 영화 / 드라마 / 애니메이션
enum Media: String {
    case movie
    case drama
    case animation
}

var nowWatch: Media = .movie

switch nowWatch {
case .movie: print("\(nowWatch) 시청중")
case .drama: print("\(nowWatch) 시청중")
case .animation: print("\(nowWatch) 시청중")
}

// 2. 성별 - 남성 / 여성
enum Gender: String {
    case male = "남성"
    case female = "여성"
}

var person: Gender = .male

switch person {
case .male: print("\(person)")
case .female: print("\(person)")
}

// CaseIterable: 열거형의 멤버들을 순회할 수 있는 컬렉션 타입처럼 사용을 가능케 한다. -> 배열처럼 쓸 수 있음
enum Words: Int, CaseIterable {
    case newjeans = 100
    case newwords = 700
    case 별다줄
    case 알잘딱깔센
}

print(Words.newjeans.rawValue)
print(Words.newwords.rawValue)
print(Words.별다줄.rawValue)
print(Words.알잘딱깔센.rawValue)

var tag = 100

Words(rawValue: 100)


let tt = Words.allCases



class EasyMonster {
    var exp = 1
    var clothes = "빨강"
    var speed = 1
    var power = 1
}

class HardMonster {
    // 어려운 몬스터
    var exp = 100
    var clothes = "파랑"
    var speed = 10
    var power = 1000000
}

// BaseClass
class Monster {
    var exp = 1
    var clothes = "빨강"
    var speed = 1
    var power = 1

    func attack() {
        print("몬스터 공격")
    }
}

let easy = Monster()
let hard = Monster()
hard.exp = 10
hard.clothes = "파랑"
hard.speed = 10
hard.power = 100000

class BossMonster: Monster {

    var specialItem = "레벨업"

    // 새로 설정한다.
    override func attack() {
        print("보스 몬스터 공격")
    }
}

let boss = BossMonster()
boss.specialItem
boss.exp = 10
boss.clothes = "파랑"
boss.speed = 10
boss.power = 100000


boss.attack()



class BabyMonster {
    var exp = 1
    var clothes = "빨강"
    var speed = 1
    var power = 1

    func attack() {
        print("몬스터 공격")
    }
}

let baby = BabyMonster()



let number1 = 3
let numberToString = String(number1)

type(of: number1)
type(of: numberToString)


class Mobile {
    let name: String

    init(name: String) {
        self.name = name
    }

}

class Google: Mobile {

}

class Apple: Mobile {
    let conference = "WWDC"
}

let mobile = Mobile(name: "Phone")
let google = Google(name: "구글")
let apple = Apple(name: "애플")


// is: 어떤 클래스의 인스턴스 타입인 지 확인

mobile is Mobile
mobile is Google
mobile is Apple

google is Mobile
google is Google
google is Apple

apple is Mobile
apple is Google
apple is Apple


let iphone: Mobile = Apple(name: "iPhone Pro Max")
iphone.name

type(of: iphone)


// 타입 캐스팅을 통해서 원하는 프로퍼티에 접근할 수 있도록 설정
// Type Cast Operator: as / as? as!

// as? 옵셔널 반환 타입 => 실패할 경우 nil 반환
// as! 욥서널 타입 아님 => 실패할 경우 무조건 런타임 오류 발생

if let value = iphone as? Apple {
    print(value.conference)
}

if let value = iphone as? Google {
    print(value)
} else {
    print("타입 캐스팅 실패")
}


var something: [Any] = ["a", "b", "c", true, false, 12, 456]
something.append(0)
something.append(false)
something.append("d")
something.append(mobile)

print(something)
print(something[4])

let element = something[4]

type(of: element)

// Any: 모든 타입에 대한 인스턴스를 담을 수 있음 vs AnyObject: 클래스의 인스턴스만 담을 수 있음
// 컴파일 시점에서는 어떤 타입인지 확인할 수 없고, 런타임 시점에 타입이 결정
if let value = element as? Int {
    print(value)
} else {
    print("Int 아님")
}

if let value = element as? String {
    print(value)
} else {
    print("String 아님")
}

if let value = element as? Bool {
    print(value)
} else {
    print("Bool 아님")
}

if let value = element as? Double {
    print(value)
} else {
    print("Double 아님")
}


enum DrinkSize {
    case short, tall, grande, venti
}

class DrinkClass {
    let name: String
    var count: Int
    var size: DrinkSize

    init(name: String, count: Int, size: DrinkSize) {
        self.name = name
        self.count = count
        self.size = size
    }
}

let drinkClass = DrinkClass(name: "아샷추", count: 3300, size: .venti)

struct DrinkStruct {
    let name: String
    var count: Int
    var size: DrinkSize
}

var drinkStruct = DrinkStruct(name: "아아", count: 1500, size: .grande)
//drinkStruct.name = "메로나"
drinkStruct.count = 1900
drinkStruct.size = .short

struct Poster {
    var image: UIImage = UIImage(systemName: "star") ?? UIImage()

}

// 넷플릭스
struct Movie {

    // 타입 프로퍼티: 지연 저장 프로퍼티의 형태로 기본적으로 동작, lazy를 사용하지 않아도 됌
    static let best = "이달의 최고 영화"

    let name: String
    let runtime: Int
    // 지연 저장 프로퍼티 lazy, 상수는 인스턴스가 생성되기 전에 값을 항상 가지고 있어야 함
    lazy var video: Poster = Poster()
}

let media = Movie(name: "사랑의 불시착", runtime: 130)

Movie.best

// 호출 순간 메모리에 올라감.
// 종료 될때까지 유지됨
