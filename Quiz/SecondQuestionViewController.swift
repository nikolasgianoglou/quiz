//
//  SecondQuestionViewController.swift
//  Quiz
//
//  Created by Nikolas Coelho on 15/01/24.
//

import Foundation
import UIKit

class SecondQuestionViewController: UITableViewController {
    
    let answers: [String] = ["Portuguese", "American", "Brazilian"]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(AnswerCell.self, forCellReuseIdentifier: AnswerCell.description())
        title = "Question #2"
        tableView.allowsMultipleSelection = true
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Submit", style: .plain, target: self, action: #selector(submitTapped))
    }
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view =  HeaderView(frame: .infinite)
        view.label.text = "What's Caio's nationality?"
        return view
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
        
    }
    
    @objc func submitTapped() {
        let controller = ResultViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
}
