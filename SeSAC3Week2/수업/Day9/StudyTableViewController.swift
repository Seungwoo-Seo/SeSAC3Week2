//
//  StudyTableViewController.swift
//  SeSAC3Week2
//
//  Created by 서승우 on 2023/07/27.
//

import UIKit

final class StudyTableViewController: UITableViewController {

    let studyList = ["변수", "상수", "열거형", "옵셔널 바인딩", "메서드", "프로퍼티"]
    let appleList = ["아이폰", "아이패드", "애플워치", "바전프로"]

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = 80
    }

    override func numberOfSections(
        in tableView: UITableView
    ) -> Int {
        return 2
    }

    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        switch section {
        case 0: return studyList.count
        case 1: return appleList.count
        default: return 0
        }
    }

    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: TodoTableViewCell.identifier,
                for: indexPath
            )

            cell.textLabel?.text = studyList[indexPath.row]

            return cell

        case 1:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: TodoTableViewCell.identifier,
                for: indexPath
            )

            cell.textLabel?.text = appleList[indexPath.row]

            return cell

        default:
            return UITableViewCell()
        }
    }

    override func tableView(
        _ tableView: UITableView,
        titleForHeaderInSection section: Int
    ) -> String? {
        switch section {
        case 0: return "1번 섹션"
        case 1: return "2번 섹션"
        default: return nil
        }
//        return
    }

//    override func tableView(
//        _ tableView: UITableView,
//        heightForRowAt indexPath: IndexPath
//    ) -> CGFloat {
//        return UITableView.automaticDimension
//        if indexPath.row == 0 {
//            return 50
//        } else {
//            return 100
//        }
//    }

}
