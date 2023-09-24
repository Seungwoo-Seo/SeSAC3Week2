//
//  CustomTableViewController.swift
//  SeSAC3Week2
//
//  Created by 서승우 on 2023/07/28.
//

import UIKit


struct ToDo {
    var main: String
    var sub: String
    var like: Bool
    var done: Bool
    var color: UIColor
}

struct ToDoInfomation {
    var list = [
        ToDo(main: "장보기", sub: "오늘까지", like: false, done: false, color: randomBackgroundColor()),
        ToDo(main: "영화보기", sub: "내일까지", like: false, done: false, color: randomBackgroundColor()),
        ToDo(main: "잠자기", sub: "모레까지", like: false, done: false, color: randomBackgroundColor()),
        ToDo(main: "유튜브보기", sub: "오늘까지", like: false, done: false, color: randomBackgroundColor()),
        ToDo(main: "운동하기", sub: "사흘까지", like: false, done: false, color: randomBackgroundColor()),
        ToDo(main: "공부하기", sub: "열흘까지", like: false, done: false, color: randomBackgroundColor())
    ]

    // 타입은 lazy처럼 사용시점에 메모리에 올라감
    static func randomBackgroundColor() -> UIColor {
        let red = CGFloat.random(in: 0...1)
        let green = CGFloat.random(in: 0...1)
        let blue = CGFloat.random(in: 0...1)

        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
}


final class CustomTableViewController: UITableViewController {

    var todo = ToDoInfomation() {
        didSet {
            tableView.reloadData()
        }
    }

    @IBOutlet weak var searchBar: UISearchBar!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = 70

        searchBar.placeholder = "할 일을 입력해보세요"
        searchBar.searchTextField.addTarget(
            self,
            action: #selector(didTapReturnButton),
            for: .editingDidEndOnExit
        )
    }

    @objc
    func didTapReturnButton() {
        let data = ToDo(main: searchBar.text!, sub: "23.08.01", like: false, done: false, color: ToDoInfomation.randomBackgroundColor())

        todo.list.insert(data, at: 0)

        // UX
        searchBar.text = ""

//        tableView.reloadData()
    }

    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return todo.list.count
    }

    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: CustomTableViewCell.identifier,
            for: indexPath
        ) as? CustomTableViewCell

        let row = todo.list[indexPath.row]
        cell?.configureCell(row: row)
        cell?.likeButton.tag = indexPath.row
        cell?.likeButton.addTarget(
            self,
            action: #selector(didTapLikeButton),
            for: .touchUpInside
        )

        return cell ?? UITableViewCell()
    }

    override func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        let vc = storyboard?.instantiateViewController(
            withIdentifier: "DetailViewController"
        ) as! DetailViewController

        vc.data = todo.list[indexPath.row]

        present(vc, animated: true)

        tableView.reloadRows(
            at: [indexPath],
            with: .automatic
        )
    }

    override func tableView(
        _ tableView: UITableView,
        canEditRowAt indexPath: IndexPath
    ) -> Bool {
        return true
    }

    override func tableView(
        _ tableView: UITableView,
        commit editingStyle: UITableViewCell.EditingStyle,
        forRowAt indexPath: IndexPath
    ) {
        todo.list.remove(at: indexPath.row)

//        tableView.reloadData()
    }

    @objc
    func didTapLikeButton(_ sender: UIButton) {
        todo.list[sender.tag].like.toggle()
//        tableView.reloadData()
    }

}

final class CustomTableViewCell: UITableViewCell  {
    static let identifier = "CustomTableViewCell"

    @IBOutlet weak var checkboxImageView: UIImageView!
    @IBOutlet weak var mainTitleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()

        mainTitleLabel.font = .boldSystemFont(ofSize: 17)
        mainTitleLabel.textColor = .brown
    }

    // static func -> override class
    // 부모 객체의 스태틱 메소드를 override하면
    // override class로 키워드가 변경된다.
//    override class func awakeFromNib() {
//        <#code#>
//    }

    func configureCell(row: ToDo) {
        contentView.backgroundColor = row.color

        mainTitleLabel.text = row.main
        subTitleLabel.text = row.sub

        if row.done {
            checkboxImageView.image = UIImage(
                systemName: "checkmark.square.fill"
            )
        } else {
            checkboxImageView.image = UIImage(
                systemName: "checkmark.square"
            )
        }

        if row.like {
            likeButton.setImage(
                UIImage(systemName: "star.fill"),
                for: .normal
            )
        } else {
            likeButton.setImage(
                UIImage(systemName: "star"),
                for: .normal
            )
        }
    }

}

