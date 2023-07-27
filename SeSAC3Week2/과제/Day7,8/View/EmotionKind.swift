//
//  EmotionKind.swift
//  SeSAC3Week2
//
//  Created by 서승우 on 2023/07/25.
//

import Foundation

enum EmotionKind: Int, CaseIterable, Codable {
    case 완전행복지수
    case 적당미소지수
    case 그냥그냥점수
    case 좀속상한지수
    case 많이슬픈지수

    var title: String {
        switch self {
        case .완전행복지수: return "완전행복지수"
        case .적당미소지수: return "적당미소지수"
        case .그냥그냥점수: return "그냥그냥점수"
        case .좀속상한지수: return "좀속상한지수"
        case .많이슬픈지수: return "많이슬픈지수"
        }
    }
}
