//
//  ResultViewController.swift
//  Quiz
//
//  Created by Nikolas Coelho on 15/01/24.
//

import Foundation
import UIKit

class ResultViewController: UITableViewController {
    
    let questions: [String] = ["What's Mike's nationality?", "What's Caio's nationality?"]
    let answers: [String] = ["Portuguese", "American", "Brazilian"]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(ResultCell.self, forCellReuseIdentifier: ResultCell.description())
        title = "Result"
        tableView.allowsMultipleSelection = false
        tableView.allowsSelection = false
    }
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view =  HeaderView(frame: .infinite)
        view.label.text = "You got 1/2 correct"
        return view
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ResultCell.description(), for: indexPath) as? ResultCell
        cell?.setupView(questionText: questions[indexPath.row], correctAnswerText: answers[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    @objc func submitTapped() {
        print("Submit tapped")
    }
}
