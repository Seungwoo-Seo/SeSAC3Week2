//
//  EmotionViewController.swift
//  SeSAC3Week2
//
//  Created by 서승우 on 2023/07/25.
//

import UIKit

final class EmotionViewController: UIViewController {

    private var standardPoint = 1

    @IBOutlet var emotionButtons: [UIButton]!

    override func viewDidLoad() {
        super.viewDidLoad()

        configureHierarchy()
    }

    @IBAction func didTapEmotionButton(_ sender: UIButton) {
        guard let emotion = EmotionKind(rawValue: sender.tag)
        else {
            print("범위를 벗어난 값이 발생함.")
            return
        }

        UserDefaultsManager.shared.addEmotionCount(
            emotion,
            count: standardPoint
        )

        emotionButtonScaleAnimation(emotion: emotion)
    }

}

// UI 설정
private extension EmotionViewController {

    enum StandardPoint: Int, CaseIterable {
        case one = 1
        case five = 5
        case ten = 10
        case reset = 0

        var title: String {
            switch self {
            case .one: return "+1"
            case .five: return "+5"
            case .ten: return "+10"
            case .reset: return "리셋"
            }
        }
    }

    func configureRightBarButtonItem() {
        var actions: [UIAction] = []
        StandardPoint.allCases.forEach { point in
            actions.append(
                UIAction(
                    title: point.title,
                    handler: { [weak self] _ in
                        self?.updateStandardPoint(point)
                    }
                )
            )
        }

        let menu = UIMenu(children: actions)
        let barButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "ellipsis.circle"),
            style: .plain,
            target: self,
            action: nil
        )
        barButtonItem.menu = menu
        navigationItem.rightBarButtonItem = barButtonItem
    }

    func configureEmotionButtons() {
        EmotionKind.allCases.forEach {
            emotionButtons[$0.rawValue].tag = $0.rawValue
        }
    }

    func configureTabBar() {
        tabBarController?.tabBar.tintColor = .black
    }

    func configureHierarchy() {
        configureRightBarButtonItem()
        configureEmotionButtons()
        configureTabBar()
    }

}

// 동작
private extension EmotionViewController {

    func emotionButtonScaleAnimation(emotion: EmotionKind) {
        UIView.animate(
            withDuration: 0.3,
            animations: { [weak self] in
                self?.emotionButtons[emotion.rawValue].transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
            },
            completion: { _ in
                UIView.animate(
                    withDuration: 0.6
                ) { [weak self] in
                    self?.emotionButtons[emotion.rawValue].transform = .identity
                }
            }
        )
    }

}

// 비즈니스 로직
private extension EmotionViewController {

    func updateStandardPoint(_ point: StandardPoint) {
        if point == .reset {
            UserDefaultsManager.shared.resetEmotionCountDictionary()
        } else {
            standardPoint = point.rawValue
        }
    }

}
