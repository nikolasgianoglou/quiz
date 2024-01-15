//
//  FirstQuestionViewController.swift
//  Quiz
//
//  Created by Nikolas Coelho on 13/01/24.
//

import UIKit

class FirstQuestionViewController: UITableViewController {
    
    let answers: [String] = ["Canadian", "American", "Greek"]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(AnswerCell.self, forCellReuseIdentifier: AnswerCell.description())
        title = "Question #1"
        tableView.allowsMultipleSelection = false
    }
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return HeaderView(frame: .infinite)
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return answers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AnswerCell.description(), for: indexPath) as? AnswerCell
        cell?.setText(with: answers[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(SecondQuestionViewController(), animated: true)
    }
}
