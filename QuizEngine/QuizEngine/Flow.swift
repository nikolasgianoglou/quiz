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
            router.routeTo(question: firstQuestion, answerCallback: routeNext(firstQuestion))
        }
    }

    func routeNext(_ question: String) -> (String) -> Void {
        return { [weak self] _ in
            guard let self else { return }
            let currentQuestionIndex = questions.firstIndex(of: question)!
            let nextQuestion = questions[currentQuestionIndex+1]
            router.routeTo(question: nextQuestion, answerCallback: routeNext(nextQuestion))
        }
    }
}
