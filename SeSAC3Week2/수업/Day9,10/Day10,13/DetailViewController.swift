//
//  DetailViewController.swift
//  SeSAC3Week2
//
//  Created by 서승우 on 2023/08/02.
//

import UIKit

final class DetailViewController: UIViewController {

    var data: ToDo?

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let data else {return}
        print(data)
    }

}
