//
//  ShoppingCell.swift
//  SeSAC3Week2
//
//  Created by 서승우 on 2023/07/27.
//

import UIKit

final class ShoppingCell: UITableViewCell {
    static let identifier = "ShoppingCell"

    @IBOutlet weak var capsuleBackgroundView: UIView!
    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var searchResultLabel: UILabel!
    @IBOutlet weak var favoritesButton: UIButton!

    override func layoutSubviews() {
        super.layoutSubviews()

        configureCapsuleBackgroundView()
    }

    func configureCapsuleBackgroundView() {
        capsuleBackgroundView.layer.cornerRadius = 8
        capsuleBackgroundView.backgroundColor = .secondarySystemBackground
    }

}
