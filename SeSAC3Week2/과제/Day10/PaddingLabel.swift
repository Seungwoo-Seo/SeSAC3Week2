//
//  PaddingLabel.swift
//  SeSAC3Week2
//
//  Created by 서승우 on 2023/07/28.
//

import UIKit

final class BasePaddingLabel: UILabel {
    private var padding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: padding))
    }
}
