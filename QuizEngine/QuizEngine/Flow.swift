//
//  Flow.swift
//  QuizEngine
//
//  Created by Nikolas Gianoglou Coelho on 21/02/25.
//

import Foundation

protocol Router {
    func routeTo(question: String, answerCallback: @escaping(String) -> Void)
}

class Flow {
    let router: Router
    let questions: [String]

    init(questions: [String], router: Router) {
        self.questions = questions
        self.router = router
    }

    func start() {
        if let firstQuestion = questions.first {
            router.routeTo(question: firstQuestion) { [weak self] _ in
                guard let self else { return }
                let firstQuestionIndex = self.questions.firstIndex(of: firstQuestion)!
                let nextQuestion = self.questions[firstQuestionIndex+1]
                self.router.routeTo(question: nextQuestion) { _ in }
            }
        }
    }
}
