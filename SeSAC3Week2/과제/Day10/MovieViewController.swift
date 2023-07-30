//
//  MovieViewController.swift
//  SeSAC3Week2
//
//  Created by 서승우 on 2023/07/28.
//

import UIKit

final class MovieViewController: UIViewController {

    let movieList = MovieInfo().movie

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        configureHierarchy()
    }

}

extension MovieViewController: UITableViewDataSource {

    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return movieList.count
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: MovieTableViewCell.identifier,
            for: indexPath
        ) as? MovieTableViewCell

        let movie = movieList[indexPath.row]

        cell?.configureCell(movie: movie)

        return cell ?? UITableViewCell()
    }

}

private extension MovieViewController {

    func configureTableView() {
        tableView.rowHeight = 180
        tableView.dataSource = self
    }

    func configureHierarchy() {
        configureTableView()
    }

}

final class MovieTableViewCell: UITableViewCell {
    static let identifier = "MovieTableViewCell"

    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var runtimeLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var overviewLabel: BasePaddingLabel!

    override func layoutSubviews() {
        super.layoutSubviews()

        overviewLabel.layer.borderColor = UIColor.black.cgColor
        overviewLabel.layer.borderWidth = 1

//        let newSize = overviewLabel.sizeThatFits(overviewLabel.frame.size) //1

//        let newSize = overviewLabel.sizeThatFits( CGSize(width: overviewLabel.frame.width, height: CGFloat.greatestFiniteMagnitude))
//        overviewLabel.frame.size.height = newSize.height

//        let newSize = overviewLabel.sizeThatFits(
//            CGSize(
//                width: titleLabel.frame.width,
//                height: CGFloat.greatestFiniteMagnitude
//            )
//        ) //2
//        let newSize = overviewLabel.sizeThatFits(
//            titleLabel.frame.size
//        ) //3

//        overviewLabel.frame.size = newSize

//        let size = CGSize(
//            width: <#T##Double#>,
//            height: <#T##Double#>
//        )
//        overviewLabel.sizeThatFits(<#T##size: CGSize##CGSize#>)
//        overviewLabel.adjustsFontSizeToFitWidth = true
    }


    func configureCell(movie: Movie) {
        movieImageView.image = UIImage(named: "\(movie.title)")
        titleLabel.text = movie.title
        releaseDateLabel.text = movie.releaseDate
        runtimeLabel.text = "\(movie.runtime)분"
        rateLabel.text = "\(movie.rate)점"
        overviewLabel.text = movie.overview

        overviewLabel.sizeToFit()
    }

}
