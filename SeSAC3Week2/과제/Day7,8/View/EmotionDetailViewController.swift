//
//  EmotionDetailViewController.swift
//  SeSAC3Week2
//
//  Created by 서승우 on 2023/07/25.
//

import UIKit

final class EmotionDetailViewController: UIViewController {

    @IBOutlet var emotionDetailViews: [UIView]!
    @IBOutlet var emotionDetailTitleLabels: [UILabel]!
    @IBOutlet var emotionDetailPointLabels: [UILabel]!

    override func viewDidLoad() {
        super.viewDidLoad()

        configureHierarchy()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        updatePointLabels()
    }

}

// UI 설정
private extension EmotionDetailViewController {

    func configureEmotionDetailViewsArea() {
        EmotionKind.allCases.forEach {
            let detailView = emotionDetailViews[$0.rawValue]
            detailView.layer.cornerRadius = 8

            let titleLabel = emotionDetailTitleLabels[$0.rawValue]
            titleLabel.text = $0.title

            let pointLabel = emotionDetailPointLabels[$0.rawValue]
            pointLabel.text = "0점"
        }
    }

    func configureHierarchy() {
        configureEmotionDetailViewsArea()
    }

}

// 비즈니스 로직
private extension EmotionDetailViewController {

    func updatePointLabels() {
        let emotionCountDic = UserDefaultsManager.shared.getEmotionCountDictionary()
        if emotionCountDic.isEmpty {
            emotionDetailPointLabels.forEach {
                $0.text = "0점"
            }
        } else {
            emotionCountDic.forEach {
                emotionDetailPointLabels[$0.key.rawValue].text = "\($0.value)점"
            }
        }
    }

}
