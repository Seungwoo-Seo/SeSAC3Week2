//
//  ViewController.swift
//  SeSAC3Week2
//
//  Created by 서승우 on 2023/07/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    @IBOutlet weak var thirdImageView: UIImageView!

    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!

    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!


    let list = ["가사0", "가사1", "가사2"]

    override func viewDidLoad() {
        super.viewDidLoad()

        firstImageView.isUserInteractionEnabled = true

        print(firstImageView.isUserInteractionEnabled)
        print(view.isUserInteractionEnabled)
    }

    @IBAction func didTapPlayButton(_ sender: UIButton) {
        print(list[sender.tag])
    }

    @IBAction func firstTapped(
        _ sender: UITapGestureRecognizer
    ) {

    }

    @IBAction func secondTapped(
        _ sender: UITapGestureRecognizer
    ) {
        // 1.
//        firstImageView.isHidden = true

        // 2.
//        if firstImageView.isHidden == true {
//            firstImageView.isHidden = false
//        } else {
//            firstImageView.isHidden = true
//        }

        // 3.
//        firstImageView.isHidden = !firstImageView.isHidden

        // 4.
//        firstImageView.isHidden.toggle()

        // 5.
        firstImageView.isHidden = firstImageView.isHidden == true ? false : true
    }

}

