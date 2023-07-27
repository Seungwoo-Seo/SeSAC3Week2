//
//  UserDefaultsManager.swift
//  SeSAC3Week2
//
//  Created by 서승우 on 2023/07/25.
//

import Foundation

protocol UserDefaultsManagerProtocol {
    // 저장된 감정 카운트 딕셔너리를 가져와줄 메소드
    func getEmotionCountDictionary() -> [EmotionKind: Int]
    // 버튼을 클릭할 때마다 감정 카운트를 올려줄 메소드
    func addEmotionCount(_ emotion: EmotionKind, count: Int)
    // 감정 카운트 딕셔너리를 리셋해줄 메소드
    func resetEmotionCountDictionary()
    // 감정 카운트 딕셔너리를 저장해줄 메소드
    func saveEmotionCountDictionary(
        _ emotionCountDic: [EmotionKind: Int]
    )
}

final class UserDefaultsManager: UserDefaultsManagerProtocol {
    private enum Key: String {
        case emotion
    }

    static let shared = UserDefaultsManager()

    private init() {}

    /// 저장된 감정 카운트 딕셔너리를 가져와줄 메소드
    func getEmotionCountDictionary() -> [EmotionKind: Int] {
        guard let data = UserDefaults.standard.data(
            forKey: Key.emotion.rawValue
        ) else {return [:]}

        return (try? PropertyListDecoder().decode(
            [EmotionKind: Int].self,
            from: data
        )) ?? [:]
    }

    /// 버튼을 클릭할 때마다 감정 카운트를 올려줄 메소드
    func addEmotionCount(
        _ emotion: EmotionKind,
        count: Int
    ) {
        // 1. 버튼이 눌렸으면 저장된 감정 카운트 딕셔너리를 가져온다.
        // 2. 가져온 감정 카운트 딕셔너리가 존재하는지 확인한다.
        var emotionCountDic = getEmotionCountDictionary()
        if let oldValue = emotionCountDic[emotion] {
            let newValue = oldValue + count
            emotionCountDic.updateValue(
                newValue,
                forKey: emotion
            )
            saveEmotionCountDictionary(emotionCountDic)

        // 3. 없긴하지만 비어있지 않다면 추가
        } else if !emotionCountDic.isEmpty {
            emotionCountDic.updateValue(
                count,
                forKey: emotion
            )
            saveEmotionCountDictionary(emotionCountDic)

        // 4. 없다면 새로 만들어준다.
        } else {
            saveEmotionCountDictionary([emotion: count])
        }
    }

    /// 감정 카운트 딕셔너리를 리셋해줄 메소드
    func resetEmotionCountDictionary() {
        UserDefaults.standard.removeObject(
            forKey: Key.emotion.rawValue
        )
    }

    /// 감정 카운트 딕셔너리를 저장해줄 메소드
    func saveEmotionCountDictionary(
        _ emotionCountDic: [EmotionKind: Int]
    ) {
        UserDefaults.standard.set(
            try? PropertyListEncoder().encode(emotionCountDic),
            forKey: Key.emotion.rawValue
        )
    }

}
