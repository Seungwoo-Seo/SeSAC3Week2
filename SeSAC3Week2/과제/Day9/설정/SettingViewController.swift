//
//  SettingViewController.swift
//  SeSAC3Week2
//
//  Created by 서승우 on 2023/07/27.
//

import UIKit

enum SettingSectionKind: Int, CaseIterable {
    case 전체설정
    case 개인설정
    case 기타

    var headerTitle: String {
        switch self {
        case .전체설정: return "전체 설정"
        case .개인설정: return "개인 설정"
        case .기타: return "기타"
        }
    }

    var titleList: [String] {
        switch self {
        case .전체설정:
            return [
                "공지사항", "실험실", "버전 정보"
            ]
        case .개인설정:
            return [
                "개인/보안", "알림", "채팅", "멀티프로필"
            ]
        case .기타:
            return [
                "고객센터/도움말"
            ]
        }
    }
}


final class SettingViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        configureHierarchy()
    }

}

extension SettingViewController: UITableViewDataSource {

    func numberOfSections(
        in tableView: UITableView
    ) -> Int {
        return SettingSectionKind.allCases.count
    }

    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        guard let section = SettingSectionKind(
            rawValue: section
        ) else {
            return 0
        }

        return section.titleList.count
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let section = SettingSectionKind(
            rawValue: indexPath.section
        ) else {
            return UITableViewCell()
        }

        let cell = tableView.dequeueReusableCell(
            withIdentifier: "SettingCell",
            for: indexPath
        )

        cell.textLabel?.text = section.titleList[indexPath.row]

        return cell
    }

    func tableView(
        _ tableView: UITableView,
        titleForHeaderInSection section: Int
    ) -> String? {
        guard let section = SettingSectionKind(
            rawValue: section
        ) else {
            return nil
        }

        return section.headerTitle
    }

}

extension SettingViewController: UITableViewDelegate {

//    func tableView(
//        _ tableView: UITableView,
//        viewForHeaderInSection section: Int
//    ) -> UIView? {
//        guard let section = SettingSectionKind(
//            rawValue: section
//        ) else {
//            return nil
//        }
//
//        let header = UITableViewHeaderFooterView()
//        var content = header.defaultContentConfiguration()
//
//        let title = section.headerTitle
//        let font = UIFont.boldSystemFont(ofSize: 20)
//        let attributes: [NSAttributedString.Key: Any] = [
//            .font: font,
//            .foregroundColor: UIColor.secondaryLabel
//        ]
//        content.attributedText = NSAttributedString(
//            string: title,
//            attributes: attributes
//        )
//        header.contentConfiguration = content
//
//        return header
//    }

}

private extension SettingViewController {

    func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }

    func configureHierarchy() {
        configureTableView()
    }

}
