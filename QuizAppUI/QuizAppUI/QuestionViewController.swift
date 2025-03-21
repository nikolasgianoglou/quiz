//
//  QuestionViewController.swift
//  QuizAppUI
//
//  Created by Nikolas Gianoglou Coelho on 10/03/25.
//

import Foundation
import UIKit

class QuestionViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!

    private var question: String = ""
    private var options: [String] = []

    convenience init(question: String, options: [String]) {
        self.init()
        self.question = question
        self.options = options
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        headerLabel.text = question
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = options[indexPath.row]
        return cell
    }
}
