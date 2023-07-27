//
//  TransitionViewController.swift
//  SeSAC3Week2
//
//  Created by 서승우 on 2023/07/24.
//

import Kingfisher
import UIKit

final class TransitionViewController: UIViewController {

    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var actorImgeView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: "https://src.hidoc.co.kr/image/lib/2022/5/12/1652337370806_0.jpg")
        actorImgeView.kf.setImage(with: url)
    }

    // 다른 화면에서 TransitionViewController로 돌아올 때(unwind) 사용하는 기능
    // 액션 연결하지 않고, 직접 작성
    // unwind 라는 키워드를 돌아갈때 많이 쓴다.
    @IBAction func unwindToHome(_ sender: UIStoryboardSegue) {
        
    }

    @IBAction func segmentValueChanged(_ sender: UISegmentedControl) {
        // http는 apple에서 block함
        // 근데 사용하고 싶다면 그런걸 -> App Transport Security (ATS) 라고한다.
        guard let actor = Actor(
            rawValue: sender.selectedSegmentIndex
        ) else {
            return
        }

        let url: URL?

        switch actor {
        case .man:
            url = URL(
                string: "https://www.palnews.co.kr/news/photo/201801/92969_25283_5321.jpg"
            )
            actorImgeView.kf.setImage(with: url)
        case .woman:
            url = URL(
                string: "https://img1.daumcdn.net/thumb/R658x0.q70/?fname=https://t1.daumcdn.net/news/202301/04/bemypet/20230104190107021brrt.png"
            )
            actorImgeView.kf.setImage(with: url)
        }
    }

}
