//
//  ResultsViewController.swift
//  QuizAppUI
//
//  Created by Nikolas Gianoglou Coelho on 05/05/25.
//

import Foundation
import UIKit

struct PresentableAnswer {
    let isCorrect: Bool
}

class CorrectAnswerCell: UITableViewCell {

}

class WrongAnswerCell: UITableViewCell {

}

class ResultsViewController: UIViewController, UITableViewDataSource {
    private var summary = ""
    private var answers = [PresentableAnswer]()
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    convenience init(summary: String, answers: [PresentableAnswer]) {
        self.init()
        self.summary = summary
        self.answers = answers
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        headerLabel.text = summary
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return answers.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let answer = answers[indexPath.row]
        return answer.isCorrect ? CorrectAnswerCell() : WrongAnswerCell()
    }
}
