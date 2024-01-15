//
//  ResultCell.swift
//  Quiz
//
//  Created by Nikolas Coelho on 15/01/24.
//

import Foundation
import UIKit

class ResultCell: UITableViewCell {
    
    var didAnswerCorrect: Bool
    
    lazy var question: UILabel = {
        let label = UILabel()
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var correctAnswer: UILabel = {
        let label = UILabel()
        label.textColor = .systemGreen
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var wrongAnswer: UILabel = {
        let label = UILabel()
        label.textColor = .systemRed
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle = .default, reuseIdentifier: String?) {
        didAnswerCorrect = false
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setupContraints()
    }
    
    convenience init(style: UITableViewCell.CellStyle = .default, reuseIdentifier: String?, didAnswerCorrect: Bool = false) {
        self.init(style: style, reuseIdentifier: reuseIdentifier)
        self.didAnswerCorrect = didAnswerCorrect
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        contentView.addSubview(question)
        contentView.addSubview(correctAnswer)
//        if !didAnswerCorrect { contentView.addSubview(wrongAnswer) }
    }
    
    private func setupContraints() {
        NSLayoutConstraint.activate([
            question.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            question.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10),
            question.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            
            correctAnswer.topAnchor.constraint(equalTo: question.bottomAnchor, constant: 10),
            correctAnswer.leadingAnchor.constraint(equalTo: question.leadingAnchor),
            correctAnswer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -50)
        ])
        
//        if !didAnswerCorrect {
//            NSLayoutConstraint.activate([
//                wrongAnswer.topAnchor.constraint(equalTo: correctAnswer.bottomAnchor, constant: 10),
//                wrongAnswer.leadingAnchor.constraint(equalTo: correctAnswer.leadingAnchor),
//                wrongAnswer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 50)
//            ])
//        }
    }
    
    func setupView(questionText: String, correctAnswerText: String) {
        question.text = questionText
        correctAnswer.text = correctAnswerText
//        wrongAnswer.text = "Test"
    }
}
