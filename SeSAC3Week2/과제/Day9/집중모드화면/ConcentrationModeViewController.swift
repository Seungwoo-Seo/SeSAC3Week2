//
//  ConcentrationModeViewController.swift
//  SeSAC3Week2
//
//  Created by 서승우 on 2023/07/27.
//

import UIKit

enum SectionKind: Int, CaseIterable {
    case mode
    case share

    var headerTitle: String? {
        switch self {
        case .mode: return "모드 설정"
        case .share: return nil
        }
    }

    var footerTitle: String {
        switch self {
        case .mode: return "집중 모드에서는 경고 및 알림 소리가 울리지 않습니다."
        case .share: return "이 기기에서 집중 모드를 켜면 사용자의 다른 기기에서도 집중 모드가 켜집니다."
        }
    }
}

struct ConcentrationMode: Hashable {
    let image: UIImage?
    let titie: String
    let subTitle: String?
    let detailTitle: String?
    private let _id = UUID()
}

final class ConcentrationModeViewController: UIViewController {
    // MARK: - View
    @IBOutlet weak var collectionView: UICollectionView!

    // MARK: - DataSource
    private var dataSource: UICollectionViewDiffableDataSource<SectionKind, ConcentrationMode>!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        navigationItem.title = "집중모드"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        collectionView.collectionViewLayout = createLayout()
        configureDataSource()
    }

    func createLayout() -> UICollectionViewLayout {
        var separatorConfig = UIListSeparatorConfiguration(listAppearance: .insetGrouped)
        separatorConfig.color = .white

        var config = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        config.headerMode = .supplementary
        config.footerMode = .supplementary
        config.backgroundColor = .black
        config.separatorConfiguration = separatorConfig

        let layout = UICollectionViewCompositionalLayout.list(using: config)
        return layout
    }

    func configureDataSource() {
        let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, ConcentrationMode> { cell, indexPath, itemIdentifier in

            var content: UIListContentConfiguration
            if itemIdentifier.titie == "업무" {
                content = UIListContentConfiguration.subtitleCell()
                content.image = itemIdentifier.image
                content.text = itemIdentifier.titie
                content.secondaryText = itemIdentifier.subTitle
            } else {
                content = UIListContentConfiguration.valueCell()
                content.image = itemIdentifier.image
                content.text = itemIdentifier.titie
                content.secondaryText = itemIdentifier.detailTitle
            }
            let symbolConfig = UIImage.SymbolConfiguration(scale: .medium)
            content.directionalLayoutMargins = .init(top: 8, leading: 0, bottom: 8, trailing: 0)
            content.imageProperties.preferredSymbolConfiguration = symbolConfig
            content.textProperties.font = .systemFont(ofSize: 15)
            content.textProperties.color = .white
            content.secondaryTextProperties.font = .systemFont(ofSize: 15)
            content.secondaryTextProperties.color = .white

            var backgroundConfig = UIBackgroundConfiguration.listPlainCell()
            backgroundConfig.backgroundColor = .darkGray

            cell.contentConfiguration = content
            cell.backgroundConfiguration = backgroundConfig
            cell.accessories = [.disclosureIndicator(options: .init(tintColor: .systemGray))]
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
            let section = SectionKind.allCases[indexPath.section]
            var content = UIListContentConfiguration.groupedHeader()
            content.text = section.headerTitle
            content.textProperties.color = .lightGray
            supplementaryView.contentConfiguration = content
        }

        let footerRegistration = UICollectionView.SupplementaryRegistration<UICollectionViewListCell>(
            elementKind: UICollectionView.elementKindSectionFooter
        ) { supplementaryView, elementKind, indexPath in
            let section = SectionKind.allCases[indexPath.section]
            var content = UIListContentConfiguration.groupedFooter()
            content.text = section.footerTitle
            content.textProperties.color = .lightGray
            supplementaryView.contentConfiguration = content
        }

        dataSource.supplementaryViewProvider = { (collectionView, elementKind, indexPath) -> UICollectionReusableView in
            if elementKind == UICollectionView.elementKindSectionHeader {
                 return collectionView.dequeueConfiguredReusableSupplementary(
                    using: headerRegistration,
                    for: indexPath
                 )
             } else {
                 return collectionView.dequeueConfiguredReusableSupplementary(
                    using: footerRegistration,
                    for: indexPath
                 )
             }
        }

        var snapshot = NSDiffableDataSourceSnapshot<SectionKind, ConcentrationMode>()
        snapshot.appendSections(SectionKind.allCases)
        snapshot.appendItems(
            [
                ConcentrationMode(
                    image: UIImage(systemName: "moon.fill")?.withTintColor(.magenta, renderingMode: .alwaysOriginal),
                    titie: "방해 금지 모드",
                    subTitle: nil,
                    detailTitle: "켬"
                ),
                ConcentrationMode(
                    image: UIImage(systemName: "bed.double.fill")?.withTintColor(.orange, renderingMode: .alwaysOriginal),
                    titie: "수면",
                    subTitle: nil,
                    detailTitle: nil
                ),
                ConcentrationMode(
                    image: UIImage(systemName: "lanyardcard.fill")?.withTintColor(.green, renderingMode: .alwaysOriginal),
                    titie: "업무",
                    subTitle: "09:00 ~ 18:00",
                    detailTitle: nil
                ),
                ConcentrationMode(
                    image: UIImage(systemName: "person.fill")?.withTintColor(.systemBlue, renderingMode: .alwaysOriginal),
                    titie: "개인 시간",
                    subTitle: nil,
                    detailTitle: "설정"
                )
            ],
            toSection: .mode
        )
        snapshot.appendItems(
            [
                ConcentrationMode(
                    image: nil,
                    titie: "모든 기기에서 공유",
                    subTitle: nil,
                    detailTitle: nil
                )
            ],
            toSection: .share
        )

        dataSource.apply(snapshot)
    }

}
