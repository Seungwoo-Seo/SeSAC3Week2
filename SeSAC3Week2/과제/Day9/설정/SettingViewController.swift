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
}

struct Setting: Hashable {
    let title: String
    private let _id = UUID()
}


final class SettingViewController: UIViewController {
    // MARK: - View
    @IBOutlet weak var collectionView: UICollectionView!

    // MARK: - DataSource
    private var dataSource: UICollectionViewDiffableDataSource<SettingSectionKind, Setting>!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        navigationItem.title = "설정"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        collectionView.collectionViewLayout = createLayout()
        configureDataSource()
    }

    func createLayout() -> UICollectionViewLayout {
        var separatorConfig = UIListSeparatorConfiguration(listAppearance: .plain)
        separatorConfig.color = .gray

        var config = UICollectionLayoutListConfiguration(appearance: .plain)
        config.headerMode = .supplementary
        config.backgroundColor = .black
        config.separatorConfiguration = separatorConfig

        let layout = UICollectionViewCompositionalLayout.list(using: config)
        return layout
    }

    func configureDataSource() {
        let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, Setting> { cell, indexPath, itemIdentifier in

            var content = UIListContentConfiguration.cell()
            content.text = itemIdentifier.title
            content.textProperties.color = .white
            content.textProperties.font = .systemFont(ofSize: 13)

            var backgroundConfig = UIBackgroundConfiguration.listPlainCell()
            backgroundConfig.backgroundColor = .black

            cell.contentConfiguration = content
            cell.backgroundConfiguration = backgroundConfig
        }

        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView) { collectionView, indexPath, itemIdentifier in
            return collectionView.dequeueConfiguredReusableCell(
                using: cellRegistration,
                for: indexPath,
                item: itemIdentifier
            )
        }

        let headerRegistration = UICollectionView.SupplementaryRegistration<UICollectionViewListCell>(
            elementKind: UICollectionView.elementKindSectionHeader
        ) { supplementaryView, elementKind, indexPath in
            let section = SettingSectionKind.allCases[indexPath.section]
            var content = UIListContentConfiguration.plainHeader()
            content.text = section.headerTitle
            content.textProperties.color = .lightGray
            content.textProperties.font = .systemFont(ofSize: 17)
            supplementaryView.contentConfiguration = content
        }

        dataSource.supplementaryViewProvider = { (collectionView, elementKind, indexPath) -> UICollectionReusableView in
            return collectionView.dequeueConfiguredReusableSupplementary(
                using: headerRegistration,
                for: indexPath
            )
        }

        var snapshot = NSDiffableDataSourceSnapshot<SettingSectionKind, Setting>()
        snapshot.appendSections(SettingSectionKind.allCases)
        snapshot.appendItems(
            [
                Setting(title: "공지사항"),
                Setting(title: "실험실"),
                Setting(title: "버전 정보")
            ],
            toSection: .전체설정
        )
        snapshot.appendItems(
            [
                Setting(title: "개인/보안"),
                Setting(title: "알림"),
                Setting(title: "채팅"),
                Setting(title: "멀티프로필")
            ],
            toSection: .개인설정
        )
        snapshot.appendItems(
            [
                Setting(title: "고객센터/도움말")
            ],
            toSection: .기타
        )

        dataSource.apply(snapshot)
    }

}
