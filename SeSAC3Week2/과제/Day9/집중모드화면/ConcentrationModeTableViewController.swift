//
//  ConcentrationModeTableViewController.swift
//  SeSAC3Week2
//
//  Created by 서승우 on 2023/07/27.
//

import UIKit

final class ConcentrationModeTableViewController: UITableViewController {

    @IBOutlet var tableViewCells: [UITableViewCell]!

    override func viewDidLoad() {
        super.viewDidLoad()

        configureHierarhy()
    }

}

private extension ConcentrationModeTableViewController {

    func configureTableView() {
        tableView.separatorColor = .white
    }

    func configureTableViewCells() {
//        tableViewCells.forEach {
//            let button = UIButton(type: .custom)
//            button.setImage(
//                UIImage(systemName: "heart"),
//                for: .normal
//            )
//            button.tintColor = .red
//
//            let image = UIImage(systemName: "chevron.right")?.withRenderingMode(.alwaysTemplate)
//            let imageView = UIImageView(image: image)
//            imageView.tintColor = .darkGray
//            $0.accessoryView = imageView
//        }
    }

    func configureHierarhy() {
        configureTableView()
        configureTableViewCells()
    }

}
