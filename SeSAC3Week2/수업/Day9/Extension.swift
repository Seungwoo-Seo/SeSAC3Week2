//
//  Extension.swift
//  SeSAC3Week2
//
//  Created by 서승우 on 2023/07/27.
//

import UIKit

extension UITableViewController {

    func showAlert() {
        let alert = UIAlertController(
            title: "hi",
            message: "h",
            preferredStyle: .alert
        )
        let confirm = UIAlertAction(
            title: "확인",
            style: .cancel
        )
        alert.addAction(confirm)

        present(alert, animated: true)
    }

}

extension UILabel {

    func configureTitleText() {
        textColor = .red
        font = .boldSystemFont(ofSize: 20)
        textAlignment = .center
    }

}
