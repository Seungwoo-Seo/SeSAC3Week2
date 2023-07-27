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



