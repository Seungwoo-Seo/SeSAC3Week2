//
//  ShoppingViewController.swift
//  SeSAC3Week2
//
//  Created by 서승우 on 2023/07/27.
//

import UIKit

enum ShoppingSectionKind: Int, CaseIterable {
    case todo
}

final class ShoppingViewController: UIViewController {

    // 구매할 목록
    private var todoList: [String] = []

    @IBOutlet weak var capsuleBackgroundView: UIView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        configureHierarchy()
    }

    @IBAction func didTapAddButton(_ sender: UIButton) {
        guard let text = searchTextField.text
        else {return}

        let todo = text.trimmingCharacters(
            in: .whitespaces
        )

        if todo.isEmpty {
            // 안돼 돌아가
            let alert = UIAlertController(
                title: "구매할 것을 입력해주세요.",
                message: nil,
                preferredStyle: .alert
            )
            let confirm = UIAlertAction(
                title: "확인",
                style: .cancel
            )
            alert.addAction(confirm)
            present(alert, animated: true)

        } else {
            todoList.append(todo)
            tableView.reloadData()
        }
    }

}

extension ShoppingViewController: UITableViewDataSource {

    func numberOfSections(
        in tableView: UITableView
    ) -> Int {
        return ShoppingSectionKind.allCases.count
    }

    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        guard let section = ShoppingSectionKind(
            rawValue: section
        ) else {
            return 0
        }

        switch section {
        case .todo: return todoList.count
        }
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "ShoppingCell",
            for: indexPath
        ) as? ShoppingCell

        cell?.searchResultLabel.text = todoList[indexPath.row]

        return cell ?? UITableViewCell()
    }

}

extension ShoppingViewController: UITableViewDelegate {

    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        print("\(indexPath)")
    }

}

private extension ShoppingViewController {

    func configureCapsuleBackgroundView() {
        capsuleBackgroundView.layer.cornerRadius = 8
        capsuleBackgroundView.backgroundColor = .secondarySystemBackground
    }

    func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
    }

    func configureHierarchy() {
        configureCapsuleBackgroundView()
        configureTableView()
    }

}
