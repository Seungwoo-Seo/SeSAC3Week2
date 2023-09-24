//
//  TodoTableViewController.swift
//  SeSAC3Week2
//
//  Created by 서승우 on 2023/07/27.
//

import UIKit

final class TodoTableViewController: UITableViewController {

    var todoList = [
        "장보기",
        "영화보기",
        "잠자기",
        "코드보기",
        "쇼핑하기",
        "유튜브보기"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func numberOfSections(
        in tableView: UITableView
    ) -> Int {
        return 1//TodoTableViewSectionKind.allCases.count
    }

    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
//        guard let section = TodoTableViewSectionKind(
//            rawValue: section
//        ) else {return 0}
//
//        switch section {
//        case .first: return 1
//        case .second: return 2
//        case .third: return 3
//        }

        return todoList.count
    }

    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(
//            withIdentifier: TodoTableViewCell.identifier,
//            for: indexPath
//        ) as? TodoTableViewCell

        let cell = tableView.dequeueReusableCell(withIdentifier: TodoTableViewCell.identifier, for: indexPath)


        cell.backgroundColor = indexPath.row % 2 == 0 ? .lightGray : .white

        cell.textLabel?.text = todoList[indexPath.row]

        return cell //?? UITableViewCell()
    }

    override func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        return 80
    }

    override func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        print("hi~")
    }

    @IBAction func didTapRightButton(_ sender: UIBarButtonItem) {

        showAlert()


        todoList.append("고래밥 먹기")
        print(todoList)


        tableView.reloadData()
    }


}
